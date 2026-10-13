#!/bin/bash

{
    echo "=== Relatorio de Monitoramento ==="
    echo "Data e hora:"
    date

    echo
    echo "Uso do disco:"
    df -h /

    echo
    echo "Uso da memoria:"
    free -h
} | tee relatorio.log
