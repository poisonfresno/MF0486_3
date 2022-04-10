#!/bin/bash
#prunell

while :
do
#Menu
clear
	echo "\e[1;32m"
	echo "MENU SCRIPT V.1"
	echo ""
	echo "1. Update"
	echo "2. Upgrade"
	echo "3. Puertos abiertos"
	echo "4. Autoremover paquetes (purgar)"
	echo "5. Auditar sistema con Lynis"
	echo "6. Eliminar paquetes obsoletos"
	echo "7. Información del sistema"
	echo ""
	echo "99. Salir"
	echo ""
	
#Escoger menu
echo -n "Escoger opcion: "
read opcion
#Seleccion de menu
case $opcion in

	1) echo "Actualizando"
	apt-get update
	;;

	2) echo "Upgrading"
	apt-get upgrade -y
	;;

	3) echo "Puertos abiertos"
	ss -tl
	read foo
	;;
	
	4) echo "Limpiando paquetes"
	apt autoremove
	;;
	
	5) echo "Auditando sistema..."
	lynis audit system > lynisReport.txt
	;;
	
	6) echo "Limpiando el sistema..."
	apt-get clean
	apt-get autoremove
	;;
	
	7) echo "Información de red:"
	ifconfig -a
	read foo
	;;

99)exit 0;;
#Alerta
*)echo "Opcion invalida..."
sleep 1
esac
done
