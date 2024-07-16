#!/bin/sh
# Creador: TakYzGG

# Variables
bashrc=https://raw.githubusercontent.com/TakYzGG/Void-Linux/main/Utilidades/.bashrc
fluxbox=https://github.com/TakYzGG/Dotfiles

# Actualizar el sistema
echo "Actualizando el sistema..."
apt update
apt upgrade

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
apt install -y wget git firefox btop galculator mirage arandr l3afpad gparted xarchiver thunar thunar-volman thunar-archive-plugin pavucontrol vlc audacious libreffice lxappearance

# Descargar temas
echo "Descargando temas..."
apt install -y papirus-icon-theme arc-theme arch-icon-theme

# Configurar Fluxbox
echo "Configurando fluxbox..."
read -p "¿Cual es tu nombre de usuario?: " usuario
git clone $fluxbox
rm -rf /home/$usuario/.fluxbox
mv Dotfiles/.fluxbox /home/$usuario
mv Dotfiles/Wallpapers /home/$usuario
rm -rf Dotfiles
mkdir -p /home/$usuario/.config/gtk-3.0
touch /home/$usuario/.config/gtk-3.0/settings.ini
echo "[Settings]" >> /home/$usuario/.config/gtk-3.0/settings.ini
echo "gtk-theme-name=Arch-Dark" >> /home/$usuario/.config/gtk-3.0/settings.ini
echo "gtk-icon-theme-name=Papirus-Dark" >> /home/$usuario/.config/gtk-3.0/settings.ini

# Configurar bash
echo "Configurando bash..."
rm -rf /home/$usuario/.bashrc
rm -rf /root/.bashrc
wget $bashrc
cp .bashrc /home/$usuario
cp .bashrc /root

# Crear carpetas personales
echo "Creando carpetas personales..."
apt install -y xdg-user-dirs
xdg-user-dirs-update

# Instalar ufw (Firewall)
echo "Instalando ufw..."
apt install -y ufw
echo "Configurando ufw..."
ufw allow http
ufw allow https
ufw default deny incoming
ufw default allow outgoing
ufw enable

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
