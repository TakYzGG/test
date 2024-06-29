#!/bin/bash
#Instalador de debiaCopiar archivos de configuracin

# Actualizar el sistema
echo "Actualizando el sistema"
apt install update

# Instalar servidor grafico y terminal
echo "Instalando el servidor grafico"
apt install -y xorg xinit lxterminal

# Instalar pulseaudio y habilitarlo
echo "Instalando pulseaudio"
apt install -y pulseaudio pavucontrol
sistemctl --user enable pulseaudio
sistemctl --user start pulseaudio

# Instalar NetworkManager y habilitarlo
echo "Instalando Network Manager"
apt install -y network-manager network-manager-gnome
sistemctl --user enable NetworkManager
sistemctl --user start NetworkManager

# Instalar Programas adicionales
echo "Instalando programas adicionales"
apt install -y libreoffice
apt install -y firefox-esr
apt install -y leafpad
apt install -y vlc
apt install -y gparted
apt install -y thunar
apt install -y galculator
apt install -y dmenu
apt install -y xreader
apt install -y audacius
apt install -y xarchiver

# Instalar Fluxbox y complementos
echo "Instalando Fluxbox"
apt install -y fluxbox feh

# Mensaje final
echo "La instalacion termino"
echo "Copiar archivos de configuracion"
