# Instalar OneShot en termux

# Instalar paquetes
pkg install -y root-repo
pkg install -y git tsu python wpa-supplicant pixiewps iw openssl

# Descargar OneShot
 git clone https://github.com/kimocoder/OneShot

# Correr OneShot
sudo python OneShot/oneshot.py -i wlan0 --iface-down -K
