#!/bin/bash
# Creador: TakYz_GG
# OS: ZenOS v1 (beta)

#---------------------------
# <<--Actualizar Sistema-->>
#---------------------------

# Actualizar el sisteman
xbps-install -S
xbps-install -u

#------------------
# <<--Descargas-->>
#------------------

# Descargar xorg
xbps-install -S xorg

# Descargar LxTerminal
xbps-install -S lxterminal

# Descargar Pavucontrol
xbps-install -S pavucontrol

# Descarrgar LxAppearance
xbps-install -S lxappearance

# Descargar LxDM
xbps-install -S lxdm

# Descargar NetworkManager
xbps-install -S NetworkManager

# Descargar PulseAudio
xbps-install -S pulseaudio

# Descargar PulseAudio-Alsa
xbps-install -S alsa-plugins-pulseaudio

#--------------------
# <<--Compresores-->>
#--------------------

# Descargar Compresores
xbps-install -S xz tar zip unzip rar unrar

#---------------
# <<--Codecs-->> 
#---------------

# Clonar repos
xbps-install -S void-repo-multilib
xbps-install -S void-repo-nonfree

# Descargar Codecs
xbps-install -S mp3 ogg flac aac h.264 vp9 hevc theora

#----------------------------
# <<--Habilitar Servicios-->>
#----------------------------

# Habiliar servicio de LxDM
ln -s /etc/sv/lxdm /var/service/

# Habilitar NetworkManager
ln -s /etc/sv/NetworkManager /var/service/

# Habilitar PulseAudio
ln -s /etc/sv/pulseaudio /var/service/

# Habilitar Dbus
ln -s /etc/sv/dbus /var/service

#--------------------------
# <<--Iniciar Servicios-->>
#--------------------------

# Iniciar NetworkManager
sv enable NetworkManager

# Iniciar PulseAudio
sv enable pulseaudio