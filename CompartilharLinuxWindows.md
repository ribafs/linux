# Compartilhando pastas entre linux e windows

Supondo duas máquinas

Linux com Ubuntu 20.10 - 192.168.0.5, compartilhar a pasta /home/ribafs/backup

Windows 10

## No Ubuntu

- Instalar o samba

sudo apt install samba

- Abrir o Nautilis
- Selecionar a pasta a compartilhar e clicar nela com o botão direito
- Compartilhamento de rede local
- Compartilhar esta pasta
- Nome do compartilhamento - backup
- Marque as outras opções como desejar

## No Windows

- Abrir o gerenciador de arquivos (Windows Explorer)
- Clicar na barra de endereços acima e digitar:

\\192.168.0.5

E teclar enter

Então aparecerá 'backup'

- Efetue um duplo clique em backup para que seja aberta
- Podemos criar um atalho para facilitar, clicando acima em Acesso Rápido com o botão direito
- Fixar pasta atual em Acesso rápido

Agora tudo que for gravado nas pasta /home/ribafs/backup estará disponível no atalho 'backup' criado no windows (gerenciador de arquivos).

Caso tenha algum problema de permissão reinicie o samba

sudo service smbd restart


