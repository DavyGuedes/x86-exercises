org 0x7c00
bits 16

mov ax, 0
mov ds, ax

cli

mov al, 0x13
int 0x10

int 0x13
mov ah, 0x02
mov al, 1
mov ch, 0
mov dh, 0
mov cl, 2
mov bx, 0x7e00
int 0x13


mov si, matricula
mov ah, 0x0e

printar:
    mov al, [si]
    mov dl, [bx]

    or al,al
    jz .fim

    cmp dl, 10
    je .reset

    sub dl, al
    int 0x10

    inc si
    inc bx
    jmp printar

.reset:
    mov si, matricula
    jmp printar

.fim:
    hlt

matricula: db 4, 1, 8, 4, 6, 5, 10 

times 510 - ($-$$) db 0
dw 0xaa55