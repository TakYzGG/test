#!/bin/sh
# Creador: TakYzGG

# Variables
bashrc=https://raw.githubusercontent.com/TakYzGG/Void-Linux/main/Utilidades/.bashrc
fluxbox=https://github.com/TakYzGG/Dotfiles

# Actualizar el sistema
echo "Actualizando el sistema..."
apt install update

# Instalar servidor grafico y terminal
echo "Instalando el servidor grafico..."
apt install -y xorg xinit lxterminal

# Instalar compresores
apt install -y zip unzip p7zip

# Añadir compatibilidad con exfat
echo "Añadiendo compatibilidad con exfat..."
apt install -y exfat-fuse

# Instalar Fluxbox y complementos
echo "Instalando Fluxbox..."
apt install -y fluxbox dmenu feh

# Instalar Programas adicionales
echo "Instalando programas adicionales..."
apt install -y wget git firefox btop galculator xreader mirage arandr l3afpad gparted xarchiver thunar thunar-volman thunar-archive-plugin pavucontrol vlc audacious libreffice lxappearance

# Configurar Fluxbox
echo "Configurando fluxbox..."
read -p "¿Cual es tu nombre de usuario?: " usuario
git clone $fluxbox
rm -rf /home/$usuario/.fluxbox
mv Dotfiles/.fluxbox /home/$usuario
mv Dotfiles/Wallpapers /home/$usuario
rm -rf Dotfiles

# Configurar bash
echo "Configurando bash..."
rm -rf /home/$usuario/.bashrc
rm -rf /root/.bashrc
wget $bashrc
cp .bashrc /home/$usuario
cp .bashrc /root

# Instalar pulseaudio y habilitarlo
echo "Instalando pulseaudio..."
apt install -y pulseaudio pavucontrol
sistemctl --user enable pulseaudio
sistemctl --user start pulseaudio

# Instalar NetworkManager y habilitarlo
echo "Instalando Network Manager..."
apt install -y network-manager
sistemctl --user enable NetworkManager
sistemctl --user start NetworkManager

# Instalar lxdm y habilitarlo
echo "Instalando Lxdm..."
apt install -y lxdm
sistemctl --user enable lxdm
sistemctl --user start lxdm

# Mensaje final
echo "La instalacion termino"
