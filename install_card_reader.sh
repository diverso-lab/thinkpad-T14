#!/bin/bash

# Script para instalar los drivers y middleware necesarios para el lector de tarjetas inteligentes en Ubuntu

echo "Actualizando la lista de paquetes..."
sudo apt-get update

echo "Instalando PCSC Lite y herramientas..."
sudo apt-get install -y pcscd pcsc-tools

echo "Instalando librerías para tarjetas inteligentes..."
sudo apt-get install -y libccid libpcsclite1

echo "Reiniciando el servicio PCSCD..."
sudo systemctl restart pcscd

echo "Instalación completada. Verifica conectando tu tarjeta inteligente y ejecutando 'pcsc_scan'."
