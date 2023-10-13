#!/bin/bash

# Función para obtener el estado de la batería y el nivel de carga
get_battery_status() {
    battery_info=$(acpi -b)
    battery_status=$(echo "$battery_info" | grep -oP 'Charging|Discharging' | head -1)
    battery_percent=$(echo "$battery_info" | grep -oP '[0-9]+(?=%)')

    if [ "$battery_status" == "Charging" ]; then
        echo "%{F#27FF00}%{F#e2ee6a} $battery_percent%"
    else
        echo "%{F#FF0000}%{F#e2ee6a} $battery_percent%"
    fi
}

# Ejecuta la función y muestra el resultado
get_battery_status


