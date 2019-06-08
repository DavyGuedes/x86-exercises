    org 0x7c00
    bits 16
    ;hello world utilizando a interrupÃ§Ã£o 0x10

    ;AtribuiÃ§Ã£o de 0 ao registrador "Data Segment" (ds)
    mov ax, 0x00
    mov ds, ax

    ;limpa interrupÃ§Ãµes 
    cli

    ;Atribui ao registrador "Source Index" (si) o endereÃ§o do primeiro byte da mensagem
    mov si, msg

    ;Para a interrupÃ§Ã£o 0x10, AH = 0x0E envia caractere para a tela
    mov ah, 0x0e

    ;laÃ§o que pega cada caractere pelo endereÃ§o no registrador si e o exibe atravÃ©s da interrupÃ§Ã£o 0x10, parando ao encontrar o byte "0"
.loop:
    lodsb
    or al, al
    jz fim
    int 0x10
    jmp .loop

    ;para o processador
fim:
    hlt

    ;mensagem, complemento dos 512 bytes e bytes de identificaÃ§Ã£o de boot
msg:
    db "hello world"
    times 510 - ($-$$) db 0
    dw 0xaa55
