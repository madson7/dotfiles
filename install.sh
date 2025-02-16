#!/usr/bin/env bash

set -eE

source scripts/_lib.sh encrypt

if [ "$IED" = "E" ]; then
    echo "Run with 'encrypt' to encrypt"
    source scripts/encrypt.sh
elif [ "$IED" = "D" ]; then
    echo "Run with 'decrypt' to decrypt"
    source scripts/decrypt.sh
elif [ "$IED" = "I" ]; then
    echo "Run with 'install' to install"
    source scripts/pre-tasks.sh
    source scripts/packages.sh
    source scripts/symbolic-link.sh
    source scripts/pos-tasks.sh
else
    echo "Opção inválida. Por favor, escolha 'I' para instalar, 'E' para encriptar ou 'D' para desencriptar."
fi
