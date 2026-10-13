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

    echo
    echo "Verificacao de alerta do disco:"
    USO=$(df / | awk 'NR==2 {gsub("%","",$5); print $5}')

    if [ "$USO" -ge 80 ]; then
        echo "ALERTA: disco com ${USO}% de uso!"
    else
        echo "OK: disco com ${USO}% de uso."
    fi
} | tee /home/carlos/monitoramento-bash/relatorio.log
