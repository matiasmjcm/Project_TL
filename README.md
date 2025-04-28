# Project_TL
# Exo.1.2 - Contador de conciertos con Lex

## Requisitos

- Linux
- `flex`
- `gcc`

Instalación (una sola vez):

```bash
sudo apt install flex gcc

### En el terminal para 1 y para 2 solo cambia por 2.
lex Exo.1.1.lex
gcc lex.yy.c -o lexer -lfl
./lexer < commandeBillet.txt
