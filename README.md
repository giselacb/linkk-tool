# LinkK Tool

**LinkK** es una herramienta de línea de comandos que permite abrir múltiples URLs utilizando diferentes perfiles de Google Chrome. Este script está diseñado para ser intuitivo y fácil de personalizar.

## Características

- **Abrir URLs con perfiles específicos de Chrome.**
- **Soporte para abrir múltiples URLs simultáneamente.**
- **Agregar nuevas URLs y perfiles directamente desde el script.**
- **Interfaz de selección interactiva usando `fzf`.**

## Requisitos

- **Google Chrome** instalado en tu sistema.
- **`fzf`** para la selección interactiva de enlaces.
  - **Instalación de `fzf`:**
    - En **Debian/Ubuntu**: `sudo apt install fzf`
    - En **Fedora**: `sudo dnf install fzf`
    - En **Arch Linux**: `sudo pacman -S fzf`

## Instalación

1. **Clona el repositorio**:

   ```bash
   git clone https://github.com/tu-usuario/linkk-tool.git
   cd linkk-tool
Haz el script ejecutable:

chmod +x linkk.sh
Opcional: Mueve el script a un directorio en tu PATH:

sudo mv linkk.sh /usr/local/bin/linkk

## USO 

Abrir URLs con un perfil específico
linkk vault gmail t
Esto abrirá las URLs de vault y gmail con el perfil de Chrome t.

linkk add-url notion https://www.notion.so
Añadir un nuevo perfil

linkk add-profile dev Profile 6
Listar URLs y seleccionar una
linkk list t

Ejemplos
Abrir una URL específica con un perfil:
linkk gmail p

Abrir varias URLs con un perfil:
linkk vault github grafana t

Añadir una URL y luego abrirla:
linkk add-url jira https://team.atlassian.com/your-work?startRedirect=true
linkk jira t

Personalización
Puedes editar el script para añadir o modificar enlaces y perfiles según tus necesidades.

Contribuciones
Las contribuciones son bienvenidas. Por favor, haz un fork del repositorio y envía un Pull Request.

Licencia
Este proyecto está bajo la Licencia MIT.
