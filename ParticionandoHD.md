# Particionando meu HD com Mint 20

## Evitando polêmica

Não existe uma lei para se dividir um hd em partições.

Se deixarmos a distribuição se instalar e ela mesma criar as partições devemos aprender algo, mas ainda assim me parece que o melhor para cada um de nós somente nós mesmos acabamos descobrindo com o tempo, a experiência, as cabeçadas e as informações.

## Meu esquema de particionamento dos meus hds, nesta ordem:

```bash
sda1 - efi - 1 GB
sda2 - swap - 8 GB
sda3 - / - 50 a 100 GB
sda4 - /backup - restante do disco
```
## Dual boot
Veja que eu não considerei uma partição NTFS para windows. Mas em muitos casos é importante se tere windows numa partição. Então o tamanho da partição irá depender da importância do sistema. Lembrando que para começar o Windows 10 come 40GB, enquanto que o Mint 20 aqui gastou 6GB.

## VM com VirtualBox
Também temoms a opção de instalar o windows numa máquina virtual (meu preferido é o VirtualBox). Esta opção pode ser a mais indicada em alguns casos.

## Swap

O valor da swap no linux geralmente é superdimensionado, pois eu particularmente nunca vi o Linux o usar. Ops, nunca havia visto. O nosso querido Mint é bem guloso, pois estou com 8 GB e ele já tá usando swap (ao meu ver ele gasta tudo isso fazendo um ótimo trabalho):

```bash
free -m
              total       usada       livre    compart.  buff/cache  disponível
Mem.:          7840        1968        2765         303        3107        5267
Swap:          3883         236        3647
```

Usando 236 MB.

Bem, mas veja que minha swap é de 4 GB. Acho bom esse cuidado com a segurança. É muito melhor que a máquina travar por não ter RAM e nem encontrar swap para ser usado em seu lugar. Afinal de contas usar 8 GB do disco para swap não irá fazer falta para praticamente ninguém.


## Observação

Sempre que aparece uma nova versão do Mint eu gosto de formatar e instalar do zero.

Então instalo o novo por cima da partição existente em sda3.

Apenas monto a sda4 em /backup, sem formatar, pois é nela que guardo meus arquivos e sempre os mantenho intactos. Precisamos sempre ter cuidado nesta fase de particionamento, pois corremos sempre o risico de perder tudo. Então é uma boa ideia ter o backup do /backup em outra máquina ou mesmo em um HD externo. Eu mantenho geralmente uma cópia no computador do trabalho e outra num HD sata montado em um Case que tenho.

Atualmente estou aprendendo a guardar meus arquivos de backup num repositório do GitHub (private). Oferece 2 GB. Uso o GitHub Desktop.

## Instalando o GitHub desktop no Mint 20
```bash
wget -qO - https://packagecloud.io/shiftkey/desktop/gpgkey | sudo apt-key add -
sudo sh -c 'echo "deb [arch=amd64] https://packagecloud.io/shiftkey/desktop/any/ any main" > /etc/apt/sources.list.d/packagecloud-shiftky-desktop.list'
sudo apt-get update
```

## Em servidores

Em um hd de servidor geralmente devemos ser mais rigorosos e criar mais partições:
```bash
efi
swap
/
home
/tmp
/var
```
