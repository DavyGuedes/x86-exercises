org 0x7c00
bits 16

; Programa que exibe uma imagem disponibilizada com seus pixels brutos.

; AtribuiÃ§Ã£o de 0 ao registrador "Data Segment" (ds)
mov ax, 0
mov ds, ax

cli

mov ah, 0 ; zerando o ah para uso na interrupção 13 (int 0x13/AH=00h - DISK - RESET DISK SYSTEM:Forces controller to recalibrate drive heads (seek to track 0). )
mov al, 0x13 ;modo VGA 320x200 8 bits (256 cores)
int 0x10

int 0x13        ; Int 13/AH=00h - DISK - RESET DISK SYSTEM
mov ah, 2    ; fazer leitura
mov al, 32      ; quantidade de setores a ler
mov ch, 0       ; cilindro 0
mov dh, 0       ; cabeçote 0
mov cl, 2       ; primeiro setor da imagem a ser lido (no caso, o setor 1 é o do programa, e a partir do setor 2, segue a imagem, por isso "mov cl, 2")
mov bx, 0x7e00  ; endereço onde gravar os dados lidos
int 0x13    ; Int 13/AH=02h, DISK - READ SECTOR(S) INTO MEMORY

;copia pixels (end. 0x8100, ou seja, 0x7e00 + tabela de cores (256*3 bytes), para o end. de vÃ­deo no modo grÃ¡fico 0x13, 0xa000)
mov cx, 0xa000
mov es, cx
mov di, 0

copiarImagem:
    mov ax, [bx]
    mov [es:di], ax
    inc bx
    inc di
    cmp di, 16000
    je fim
    jmp copiarImagem

fim: 
    jmp fim

times 510 - ($-$$) db 0
dw 0xaa55