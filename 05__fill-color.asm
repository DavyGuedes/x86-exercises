org 0x7c00
bits 16

    mov ax, 0

    mov al, 0x13
    int 0x10        ;modo VGA 320x200 8 bits

    mov ax, 0xA000
    mov es, ax      ;inicio da memoria de video

loop:
    mov ax, 0
    int 0x16        ;recebe a entrada do usuário
    mov di, 0       ;inicializa o destino dos pixels
subloop:
    mov[es:di], al  ;grava a cor no pixel
    inc di
    cmp di, 64000
    je loop
    jmp subloop     ;continua a gravar até o 64000 (fim da mem. de video)

hlt

times 510 - ($-$$) db 0
dw 0xaa55