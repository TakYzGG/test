#!/bin/sh

version="5.10.223"
kernel="br.loc-os.com/pool/main/l/linux-$version-loc-os/linux-image-$version-loc-os_$version-loc-os-1_amd64.deb"
xdeb-paquete="linux-image-$version-loc-os-$version.loc.os.1_1.x86_64.xbps"
xbps-paquete="linux-image-$version-loc-os-$version.loc.os.1_1"

read -p "Ingresa tu nombre de usuario: " usuario
wget $kernel
xdeb -c $xdeb-paquete
mv /home/$usuario/.config/xdeb/bindpkgs/$xdeb-paquete /home/usuario/Descargas
xbps-rindex -a /home/$usuario/Descargas/xdeb-paquete
xbps-install -R /home/$usuario/Descargas/ -f $xbps-paquete
update-grub
echo "La instalacion del kernel termino"
