#!/bin/bash
echo "Instador de controladores AMD o Intel"
echo "1. Controladores de gráficos Intel"
echo "2. Controladores de gráficos AMD"
echo "3. Controladores de gráficos Vmware"
echo "4. Todos"
echo "5. Ninguno"
read -p "Ingresa el número correspondiente: " opcion

case $opcion in
    1)
        xbps-install -S xf86-video-intel
        echo "Los controladores de gráficos Intel han sido instalados correctamente."
        ;;
    2)
        xbps-install -S xf86-video-amdgpu
        echo "Los controladores de gráficos AMD han sido instalados correctamente."
        ;;
    3)
        xbps-install -S xf86-video-vmware
        echo "Los controladores de gráficos Vmware han sido instalados correctamente."
        ;;
    4)
        xbps-install -S xf86-video-intel xf86-video-amdgpu xf86-video-vmware
        echo "Todos controladores de gráficos han sido instalados correctamente."
        ;;
    5)
        echo "No se instalará ningún controlador grafico."
        ;;
    *)
        echo "Opción no válida. Por favor, ingresa 1, 2 , 3 , 4 o 5."
        ;;
esac
