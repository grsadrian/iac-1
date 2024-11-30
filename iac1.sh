#!/bin/bash

echo "Criando diretórios publico, adm, ven e sec"
sleep 5
mkdir -p /publico
mkdir -p /adm
mkdir -p /ven
mkdir -p /sec

echo "Diretórios criados !"
sleep 2
echo "Criando grupos GRP_ADM, GRP_VEN e GRP_SEC..."
sleep 5

groupadd -f GRP_ADM
groupadd -f GRP_VEN
groupadd -f GRP_SEC

echo "Grupos criados !"
sleep 2
echo "Criando usuários..."
sleep 4

useradd -m -s /bin/bash carlos -p $(openssl passwd -6 Senha123) && usermod -g GRP_ADM carlos
useradd -m -s /bin/bash maria -p $(openssl passwd -6 Senha123) && usermod -g GRP_ADM maria
useradd -m -s /bin/bash joao -p $(openssl passwd -6 Senha123) && usermod -g GRP_ADM joao

useradd -m -s /bin/bash debora -p $(openssl passwd -6 Senha123) && usermod -g GRP_VEN debora
useradd -m -s /bin/bash sebastiana -p $(openssl passwd -6 Senha123) && usermod -g GRP_VEN sebastiana
useradd -m -s /bin/bash roberto -p $(openssl passwd -6 Senha123) && usermod -g GRP_VEN roberto

useradd -m -s /bin/bash josefina -p $(openssl passwd -6 Senha123) && usermod -g GRP_SEC josefina
useradd -m -s /bin/bash amanda -p $(openssl passwd -6 Senha123) && usermod -g GRP_SEC amanda
useradd -m -s /bin/bash rogerio -p $(openssl passwd -6 Senha123) && usermod -g GRP_SEC rogerio

echo "Usuários criados !"
sleep 1
echo "Atribuindo permissões..."
sleep 4

chown root:GRP_ADM /adm/ && chmod 770 /adm
chown root:GRP_VEN /ven/ && chmod 770 /ven
chown root:GRP_SEC /sec/ && chmod 770 /sec
chown root:root /publico/ && chmod 777 /publico

echo "Permissões atribuídas !"
sleep 1
echo "Finalizando a execução do script, obrigado por utilizar :)"
sleep 3
