#!/bin/bash
# Desabilitar a ecla / que tem o keycode 191
echo "disable keyboard"
xmodmap -e 'keycode 191 =' # ou 35 ou 0x23 ou 97
#https://en.wikipedia.org/wiki/ASCII
#xmodmap -pke | less
#xmodmap -pk > mykeyboard.txt

# Disable
#xmodmap -e 'keycode 22 = '

# Enable
#xmodmap -e 'keycode 22 = BackSpace'

#http://www.mtm.ufsc.br/~krukoski/pub/linux/Xmodmap.us+

#VEr tecla pressionada: xev (ver keycode) ou: sudo showkey -k
#Then run 
#xmodmap ~/.Xmodmap
# desabilitar +: xmodmap -e "keycode 86 = "
# Criar ~/.Xmodmap com a linha
# cedilha: xmodmap -e 'keycode 47 = ç'
# sudo apt install evtest

