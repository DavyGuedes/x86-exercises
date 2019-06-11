# x86-exercices

Avaliação Final - Arquitetura de Computadores 2019.1

## Requesitos

- Montador NASM
- Editor de texto
- Software de virtualização (como Virtualbox)

## Montagem

Exemplo:

```bash
nasm -f bin programa.asm -o programa.img
```

>Substitua o nome do programa no comando acima

## Execução

O processo de execução se divide em 3 etapas:

- Criação de máquina virtual, que possua somente a controladora de disquete (necessária uma única vez)
- Adicionar a imagem do programa na controladora de disquete da máquina criada (necessária a cada mudança de imagem)
- Iniciar a máquina virtual

## TODO

- [ ] Comentar código.
