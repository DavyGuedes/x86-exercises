org 0x7c00
bits 16

cli

mov ax, 1               ;atual
mov bx, 0                  ;proximo
mov cx, 22              ;contador de interações

fibonacci:
    push ax
    push bx
    push cx
    call printi         ;imprime o atual
    pop cx
    pop bx
    pop ax

    mov dx, ax          ;guarda o atual no dx
    add ax, bx          ;o atual se torna o proximo
    mov bx, dx          ;adiciona no proximo o atual

    dec cx
    cmp cx, 0
    je end
    jmp fibonacci

printi:
    mov cx, 0           ;tamanho do stack
    mov bx, 10  
.fillstack:
        mov dx, 0       ;dx:ax = 0:ax = ax
        div bx
        add dx, '0'
        
        push dx         ;põe o resto na stack como caractere ASCII
        
        cmp ax, 0
        je .imprimir    ;quando o quociente for 0, comeca imprimir
        inc cx          ;aumenta o tamanho do stack
        
        jmp .fillstack
.imprimir:
    pop ax
    mov ah, 0x0e
    int 0x10        ;imprime topo da pilha
    cmp cx, 0       ;quando chegar na base para
    je .sair
        dec cx          ;desce na pilha
        jmp .imprimir
.sair:
    mov al, ' '
    int 0x10
    ret

end: hlt

times 510 - ($-$$) db 0
dw 0XAA55