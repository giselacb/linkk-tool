#!/bin/bash

# Define tus enlaces aquí
declare -A links=(
    ["notion"]="https://www.notion.so/freepikcompany/1c6796cff0cc48799671a3dd2ad2eac9"
    ["vault"]="https://hashicorp-vault.fpkmon.com/ui/vault/secrets"
    ["gmail"]="https://mail.google.com/mail/u/1/#inbox"
    ["word"]="https://www.office.com/?auth=1"
    ["chatgpt"]="https://chatgpt.com/c/57d5e74f-0b4d-4966-a784-fb579399976a"
    ["grafana"]="https://grafana.fpkmon.com/?orgId=1"
    ["boundary"]="https://hashicorp-boundary.fpkmon.com/scopes/o_P8d8expT08/scopes"
    ["github"]="https://github.com/freepik-company"
    ["openweb"]="https://openwebinars.net/academia/progreso/"
    ["calendar"]="https://calendar.google.com/calendar/u/0/r"
    ["factorial"]="https://app.factorialhr.com/dashboard"
    ["jira"]="https://freepikcompany.atlassian.net/jira/your-work"
)

# Define tus perfiles aquí
declare -A profiles=(
    ["t"]="Default"
    ["p"]="Profile 5"
)

# Define tus programas aquí
declare -A programs=(
    ["vscode"]="code"
    ["terminal"]="konsole"
    ["explorer"]="nautilus"
    ["slack"]="slack"
    ["kate"]="kate"
    ["dolphin"]="dolphin"
)

# Función para mostrar la ayuda
function show_help {
    echo "Uso: $0 <comando> [opciones]"
    echo ""
    echo "Comandos disponibles:"
    echo "  list <perfil>               Lista los enlaces y permite seleccionar uno para abrir con el perfil especificado."
    echo "  add-url <nombre> <url>      Añade una nueva URL al script con el nombre especificado."
    echo "  add-profile <nombre> <perfil> Añade un nuevo perfil al script con el nombre y perfil especificados."
    echo "  delete-url <nombre>         Elimina el enlace especificado del script."
    echo "  close-chrome                Cierra todas las ventanas de Google Chrome."
    echo "  run <programa> <directorio> Ejecuta un programa con el directorio de trabajo especificado."
    echo "  list-programs               Muestra la lista de programas disponibles."
    echo "  help                        Muestra esta ayuda."
    echo ""
    echo "Abrir una o varias URLs:"
    echo "  $0 <nombre_del_link_1> <nombre_del_link_2> ... <nombre_del_perfil>"
    echo "                               Abre una o varias URLs en nuevas pestañas utilizando el perfil especificado."
    echo ""
    echo "Ejemplos:"
    echo "  $0 list trabajo              Muestra una lista de enlaces y abre el seleccionado con el perfil 'trabajo'."
    echo "  $0 add-url notion https://www.notion.so"
    echo "                               Añade la URL 'https://www.notion.so' con el nombre 'notion'."
    echo "  $0 add-profile dev Profile 6"
    echo "                               Añade un nuevo perfil 'dev' asociado con 'Profile 6'."
    echo "  $0 vault gmail trabajo       Abre las URLs 'vault' y 'gmail' con el perfil 'trabajo'."
    echo "  $0 delete-url notion          Elimina el enlace con nombre 'notion'."
    echo "  $0 close-chrome              Cierra todas las ventanas de Google Chrome."
    echo "  $0 run vscode ~/mi-proyecto  Abre VSCode en el directorio '~/mi-proyecto'."
    echo "  $0 list-programs             Muestra la lista de programas disponibles."
    echo ""
}

# Función para listar los programas disponibles
function list_programs {
    echo "Programas disponibles:"
    for program in "${!programs[@]}"; do
        echo "  $program -> ${programs[$program]}"
    done
}

# Función para añadir nuevas URLs
function add_url {
    local name="$1"
    local url="$2"

    if [[ -z "$name" || -z "$url" ]]; then
        echo "Uso: $0 add-url <nombre> <url>"
        exit 1
    fi

    # Añadir la nueva URL al script
    sed -i "/^declare -A links=(/a\    [\"$name\"]=\"$url\"" "$0"
    echo "URL añadida: $name -> $url"
}

# Función para añadir nuevos perfiles
function add_profile {
    local name="$1"
    local profile="$2"

    if [[ -z "$name" || -z "$profile" ]]; then
        echo "Uso: $0 add-profile <nombre> <perfil>"
        exit 1
    fi

    # Añadir el nuevo perfil al script
    sed -i "/^declare -A profiles=(/a\    [\"$name\"]=\"$profile\"" "$0"
    echo "Perfil añadido: $name -> $profile"
}

# Función para eliminar URLs
function delete_url {
    local name="$1"

    if [[ -z "$name" ]]; then
        echo "Uso: $0 delete-url <nombre>"
        exit 1
    fi

    if [[ -z "${links[$name]}" ]]; then
        echo "El enlace $name no existe."
        exit 1
    fi

    # Eliminar la URL del script
    sed -i "/\[\"$name\"\]=/d" "$0"
    echo "URL eliminada: $name"
}

# Función para listar todos los nombres de los enlaces y seleccionar uno
function select_and_open_link {
    local profile_key="$1"
    local profile_name="${profiles[$profile_key]}"

    if [ -z "$profile_name" ]; then
        echo "Perfil no encontrado: $profile_key"
        exit 1
    fi

    selected_link=$(printf "%s\n" "${!links[@]}" | fzf --prompt="Selecciona un enlace: ")

    if [ -z "$selected_link" ]; then
        echo "No se seleccionó ningún enlace."
        exit 1
    fi

    google-chrome --profile-directory="$profile_name" "${links[$selected_link]}"
}

# Función para cerrar todas las ventanas de Google Chrome
function close_chrome {
    echo "Cerrando todas las ventanas de Google Chrome..."
    pkill -f "chrome"
}

# Función para ejecutar un programa con un directorio específico
function run_program {
    local program="$1"
    local directory="$2"

    if [ -z "${programs[$program]}" ]; then
        echo "Programa no encontrado: $program"
        exit 1
    fi

    # Convertir el directorio a una ruta absoluta
    local absolute_directory
    absolute_directory=$(realpath "$directory" 2> /dev/null)

    if [ ! -d "$absolute_directory" ]; then
        echo "Directorio no encontrado: $directory"
        exit 1
    fi

    echo "Abriendo ${programs[$program]} en el directorio $absolute_directory..."
    (cd "$absolute_directory" && "${programs[$program]}") &
}


# Verifica si el primer parámetro es "help"
if [ "$1" == "help" ]; then
    show_help
    exit 0
fi

# Comandos adicionales para añadir y eliminar URLs y perfiles
if [ "$1" == "add-url" ]; then
    add_url "$2" "$3"
    exit 0
fi

if [ "$1" == "add-profile" ]; then
    add_profile "$2" "$3"
    exit 0
fi

if [ "$1" == "delete-url" ]; then
    delete_url "$2"
    exit 0
fi

# Comando para cerrar todas las ventanas de Chrome
if [ "$1" == "close-chrome" ]; then
    close_chrome
    exit 0
fi

# Verifica si el primer parámetro es "list"
if [ "$1" == "list" ]; then
    if [ $# -ne 2 ]; then
        echo "Uso: $0 list <nombre_del_perfil>"
        exit 1
    fi
    select_and_open_link "$2"
    exit 0
fi

# Comando para listar los programas disponibles
if [ "$1" == "list-programs" ]; then
    list_programs
    exit 0
fi

# Comando para ejecutar un programa con un directorio específico
if [ "$1" == "run" ]; then
    if [ $# -ne 3 ]; then
        echo "Uso: $0 run <programa> <directorio>"
        exit 1
    fi
    run_program "$2" "$3"
    exit 0
fi

# Verifica si el número de parámetros es correcto para apertura directa
if [ $# -lt 2 ]; then
    echo "Uso: $0 <nombre_del_link> <nombre_del_perfil>"
    exit 1
fi

# Obtén el perfil para abrir las URLs
profile_name="${profiles[${@: -1}]}"

if [ -z "$profile_name" ]; then
    echo "Perfil no encontrado: ${@: -1}"
    exit 1
fi

# Abre todas las URLs especificadas con el perfil
for link_name in "${@:1:$#-1}"; do
    if [ -z "${links[$link_name]}" ]; then
        echo "Enlace no encontrado: $link_name"
        continue
    fi

    google-chrome --profile-directory="$profile_name" "${links[$link_name]}" &
done
