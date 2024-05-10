#!/bin/bash

# Este script instala y configura QEMU-KVM en Ubuntu

echo "Verificando soporte de virtualización CPU..."
if egrep -c '(vmx|svm)' /proc/cpuinfo > 0; then
    echo "Virtualización soportada en el CPU."
else
    echo "Tu CPU no soporta virtualización, o no está habilitada en el BIOS."
    exit 1
fi

echo "Actualizando paquetes..."
sudo apt update

echo "Instalando QEMU-KVM y herramientas necesarias..."
sudo apt install -y qemu-kvm libvirt-daemon-system libvirt-clients bridge-utils virt-manager

echo "Agregando el usuario actual a los grupos 'libvirt' y 'kvm'..."
sudo usermod -a -G libvirt $(whoami)
sudo usermod -a -G kvm $(whoami)

echo "Instalación completa. Por favor, cierra sesión y vuelve a entrar para que los cambios de grupo tengan efecto."

echo "Verificando la instalación de KVM..."
virsh list --all

echo "Si ves la lista de máquinas virtuales (incluso vacía), la instalación fue exitosa. Puedes gestionar las VMs con virt-manager o virsh."

