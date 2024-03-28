#!/bin/bash

echo "Elige un Gestor de ventanas (WM) o un Entorno de escritorio (DE) para instalar"
echo "¿Qué deseas instalar?"
echo "1. Gestor de ventanas (WM)"
echo "2. Entorno de escritorio (DE)" 
read -p "Ingresa el número correspondiente a tu elección: " choice

case $choice in
    1)
        echo "Has elegido instalar un gestor de ventanas (WM)."
        echo "Opciones disponibles:"
        echo "1. i3"
        echo "2. Openbox"
        echo "3. Awesome"
        read -p "Ingresa el número correspondiente al WM que deseas instalar: " wm_choice

        case $wm_choice in
            1)
                echo "Instalando i3..."
                sudo xbps-install -S i3
                ;;
            2)
                echo "Instalando Openbox..."
                sudo xbps-install -S openbox
                ;;
            3)
                echo "Instalando Awesome..."
                sudo xbps-install -S awesome
                ;;
            *)
                echo "Opción no válida. Saliendo del instalador."
                exit 1
                ;;
        esac
        ;;
    2)
        echo "Has elegido instalar un entorno de escritorio (DE)."
        echo "Opciones disponibles:"
        echo "1. GNOME"
        echo "2. KDE"
        echo "3. XFCE"
        read -p "Ingresa el número correspondiente al DE que deseas instalar: " de_choice

        case $de_choice in
            1)
                echo "Instalando GNOME..."
                sudo xbps-install -S gnome
                ;;
            2)
                echo "Instalando KDE..."
                sudo xbps-install -S kde
                ;;
            3)
                echo "Instalando XFCE..."
                sudo xbps-install -S xfce4
                ;;
            *)
                echo "Opción no válida. Saliendo del instalador."
                exit 1
                ;;
        esac
        ;;
    *)
        echo "Opción no válida. Saliendo del instalador."
        exit 1
        ;;
esac
