org 0x7c00
bits 16

mov ax, 0
mov ds, ax

cli

mov cx, 0

lerEntrada:
    mov ah, 0
    int 0x16
    
    mov ah, 0x0e
    int 0x10
    push ax
    inc cx

    cmp al, 13
    je printarContrario

    jmp lerEntrada

printarContrario:
    mov ah, 0x02
    mov dh, 1
    int 0x10
    
    .contrario:
        pop ax
        int 0x10
        dec cx
        or cx, cx
        jz fim
        jmp .contrario

fim: hlt

times 510 - ($-$$) db 0
dw 0xaa55