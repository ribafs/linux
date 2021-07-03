# Scripts para agilizar as tarefas rotineiras

Os que não requerem parâmetro uso um alias. Para os que precisam de parâmetro uso script com $1, $3, ...

## ubin
```bash 
sudo nano /usr/local/bin/ubin
sudo nano /usr/local/bin/$1
sudo chmod +x /usr/local/bin/ubin
```
## umod
```bash
sudo nano /usr/local/bin/umod
sudo chmod +x /usr/local/bin/$1
sudo chmod +x /usr/local/bin/umod
```
## Usando o ubin para criar o umod
```bash
ubin umod
```
## Usando o umod para setar o chmod +x no ubin
```bash
umod ubin
```
Se não fossem estes scripts precisariamos fazer tudo isso acima

## da - listar os maiores arquivos/diretórios de um diretório
```bash
ubin da
sudo du -a $1 | sort -n -r | head -n 20
umod da
```
### Exemplo: da /home/ribafs

## l7
```bash
ubin l7
rm -rf $1
composer create-project laravel/laravel="7.*" $1
umod l7
```
## l8
```bash
ubin l8
rm -rf $1
laravel new $1 --jet --stack=livewire
umod l8
```
## paclear
```bash
ubin paclear
php artisan $1:clear
umod paclear
```
### paclear view, paclear route

## ubin pa
```bash
php artisan make:$1 $3
umod pa
```
### pa model, pa ClientController, pa migration create_clients_table

## Como uso muito com meus pacotes
```bash
ubin cr
composer require ribafs/$1
umod cr
```
## ubin crr
```bash
composer remove ribafs/$1
umod crr
```
## gs - git sincronização do desktop com o remoto
```bash
ubin gs
git add .
git commit -m "$1"
git pull
git push
umod gs
```
## ubin buscastr
### Procurar por uma string em todos os arquivos de um diretório e Retornar os nomes de todos os arquivos que contém
### $1 - pasta
### $2 - string
```bash
find $1 -type f -exec grep -l "$2" {} +
umod buscastr
```
