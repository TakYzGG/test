#!/bin/sh

# variables
archivo_zram=https://raw.githubusercontent.com/TakYzGG/Void-Linux/main/Utilidades/zram

# inicio del script
clear
echo "-- Iniciando script post-install para void linux --\n"
read -p "Presione ENTER para continuar" a
clear

# opciones usuario
read -p "Nombre de usuario: " user
clear

echo "-- Repocitorio non-free --"
echo "[1] si"
echo "[2] no"
read -p "Opcion: " repo_nonfree
clear

echo "-- Tipo de instalacion --"
echo "[1] minima"
echo "[2] completa"
read -p "Opcion: " tipo_instalacion
clear

echo "-- Windows manager / Desktop environment --"
echo "[1] Windows managar (wm)"
echo "[2] Desktop environment (de)"
read -p "Opcion: " wm_de
clear

case $wm_de in
	1) echo "-- Windows manager --"
	   echo "[1] Bspwm"
	   echo "[2] Dwm"
	   echo "[3] Fluxbox"
	   echo "[4] I3 wm"
	   echo "[5] Openbox"
	   read -p "Opcion: " wm
	   clear
	   ;;
	2) echo "-- Desktop environment --"
	   echo "[1] Kde"
	   echo "[2] Lxde"
	   echo "[3] Mate"
	   echo "[4] Xfce"
	   read -p "Opcion: " de
	   clear
	   ;;
	*) echo "Respuesta no valida" ;;
esac

echo "-- Zram --"
echo "[1] si"
echo "[2] no"
read -p "Opcion: " zram
clear

# Actualizar el sistema / descargar paquetes
xbps-install -Suy

if [ "$repo_nonfree" -eq 1 ]; then
	xbps-install -y void-repo-nonfree
fi

case $tipo_instalacion in
	# minima
	1) xbps-install -y acpi alsa-utils binutils blueman brightnessctl exfat-utils firefox gcc git glibc-devel libX11-devel libXft-devel libXinerama-devel libXrender-devel make NetworkManager neovim net-tools pamixer pkg-config p7zip pulseaudio pulseaudio-utils python3 void-repo-multilib wget xclip xinit xorg xz zip unzip
	   ;;

	# completa
	2) xbps-install -y acpi alsa-utils audaciousc binutils blueman brightnessctl btop exfat-utils firefox galculator gcc git glibc-devel leafpad libreoffice libX11-devel libXft-devel libXinerama-devel libXrender-devel make mirage mpv NetworkManager neovim net-tools pamixer pavucontrol pkg-config p7zip pulseaudio pulseaudio-utils python3 ssr Thunar thunar-archive-plugin thunar-volman void-repo-multilib wget xarchiver xclip xinit xorg xz zip unzip
	   ;;
	*) echo "Respuesta no valida" ;;
esac

if [ "$wm_de" -eq 1 ]; then
	xbps-install -y fastfetch feh mpv vifm cmus scrot mupdf arandr gparted lxappearance
fi

case $wm in
	# bspwm
	1) xbps-install -y bspwm sxhkd lxterminal polybar 
	   ;;

	# dwm
	2) xbps-install -y  
	   ;;

	# fluxbox
	3) xbps-install -y fluxbox tint2 lxterminal
	   ;;

	# i3 wm
	4) xbps-install -y i3 i3-gaps i3blocks lxterminal 
	   ;;

	# openbox
	5) xbps-install -y openbox obconf tint2 lxterminal
	   ;;

	*) echo "Respuesta no valida" ;;
esac

case $de in
	# kde
	1) xbps-install -y kde5-baseapps 
	   ;;

	# lxde
	2) xbps-install -y lxde
	   ;;

	# mate
	3) xbps-install -y mate
	   ;;

	# xfce
	4) xbps-install -y xfce4
	   ;;

	*) echo "Respuesta no valida" ;;
esac

# intalar zram
if [ "$zram" -eq 1 ]; then
	wget -O /usr/local/bin/zram "$archivo_zram"
	chmod +x /usr/local/bin/zram
	echo "/usr/local/bin/zram start" >> /etc/rc.local
fi

# permisos al usuario
usermod -aG video $user

# iniciar servicios
# acpi
ln -s /etc/sv/acpid /var/service

# alsa
ln -s /etc/sv/alsa /var/service

# bluetooth
ln -s /etc/sv/bluetoothd /var/service
sv enable bluetoothd

# dbus
ln -s /etc/sv/dbus /var/service

# NetworkManager
ln -s /etc/sv/NetworkManager /var/service
sv enable NetworkManager

# mensaje final
clear
echo "Ya termino la instalacion\n"
read -p "Presione ENTER para reiniciar " a
reboot
