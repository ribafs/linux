#!/bin/bash
#
# Criado/adaptado por Ribamar FS - http://ribafs.org
#
zypper install -y dialog;
#
while :
 do
    clear
servico=$(dialog --stdout --backtitle 'Instalação de pacotes no Ubuntu Server 16.04 LTS - 64' \
                --menu 'Selecione a opção com a seta ou o número e tecle Enter\n' 0 0 0 \
                1 'Atualizar repositórios' \
                2 'Instalar LAMP e outros' \
                0 'Sair' )
    case $servico in
      1) zypper update;;
      2) clear;
# "Instalar pacotes básicos. Tecle Enter para instalar!";
zypper install -y apache2 apache2-mod_php7 git mc;
systemctl start apache2;
systemctl enable apache2;

# Instalar SGBDs somente para testes locais. Visto que o servidor é outro: 10.0.0.60
zypper install -y mysql-server postgresql;
systemctl start mysql;
systemctl enable mysql;

# "Instalar PHP 7 e extensões. Tecle Enter para instalar!";
zypper install -y php7-bcmath php7 php7-gd php7-mysql php7-pgsql php7-sqlite php7-curl;
zypper install -y php7-xsl curl php7-curl php7-intl php-composer;
zypper install -y php7-zip php7-mbstring php-gettext php-mbstring php7-fpm;

systemctl restart apache2;

# Instalar outros softwares
zypper install -y vokoscreen;
zypper install -y unrar zip unzip p7zip-full kolourpaint shutter lato-fonts;

# Ajustar relógio se em dual-boot
# timedatectl set-local-rtc 1 --adjust-system-clock;

zypper update;;
      0) clear;exit;;
   esac
done
