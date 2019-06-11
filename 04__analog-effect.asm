org 0x7c00
bits 16

    mov ax, 0
    mov ds, ax
    cli

    mov al, 0x13
    int 0x10        ;modo vga 320x200 8 bit

    mov ax, 0xA000
    mov es, ax      ;inicio da memoria de video
    mov di, 0       ;posicao em relacao ao inicio da memoria
    mov cl, 0       ;cor da paleta(0-255)

loop:   
    mov [es:di], cl ;pixel di da tela recebe a cor cx
    inc di          ;vai para o proxima posicao de memoria
    cmp di, 64001
    jne cont
    mov di, 0       ;se estiver no 64001(Além da tela) reseta bx para 0 e ignora o excesso(efetivamente pulando uma cor na paleta, pra realizar o efeito de onda)
cont:
    inc cl          ;vai pra proxima cor na paleta
    jmp loop        ;continua a desenhar

hlt

times 510 - ($-$$) db 0
dw 0xaa55