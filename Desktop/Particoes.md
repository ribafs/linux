# Partições no Linux

Se você é iniciante é recomendável que deixe o Linux em sua opção de particionar seu disco automaticamente ao lado do windows.

## Particionamento customizado

Segue abaixo como particiono, pois quase sempre particiono de forma customizada/avançada/manual, pois gosto de criar uma partição de backup.

1 - UEFI - 1GB
2 - swap - 1GB
3 - / - 100GB - ext4
4 - /backup - restante  - ext4

## Próximas formatações

Como guardo meus arquivos pessoais na partição de backup, nas próximas instalações/formatações eu apenas monto como ext4 a mesma, não formato para manter meus arquivos.

## Discos pequenos

Tenho um disco pequeno, 120GB. Quando uso ele não crio partição de backup, apenas as 3 primeiras.

Então eu crio as pastas:

/home/ribafs/backup - onde guardo meu backup

/home/ribafs/www - aqui fica minha pasta web, apontada por um vistualhost.

