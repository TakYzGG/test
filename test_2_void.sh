#!/bin/bash
echo "Instador de Windows Manager"
echo "1. I3"
echo "2. Qtile"
echo "3. Bspw"
echo "4. Openbox"
echo "5. Ninguno"
read -p "Ingresa el número correspondiente: " opcion

case $opcion in
    1)
        xbps-install -S i3
        ;;
    2)
        xbps-install -S qtile
        ;;        
    3)
        xbps-install -S bspw
        ;;
    4)
        xbps-install -S openbox
        ;;
    5)
        echo "No se instalará ningún Windows Manager."
        ;;
    *)
        echo "Opción no válida. Por favor, ingresa 1, 2 , 3 , 4 o 5."
        ;;
esac