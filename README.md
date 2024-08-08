# linkk-tool
Aquí tienes un ejemplo de cómo estructurar la documentación en README.md:

markdown
Copiar código
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

bash
Copiar código
chmod +x linkk.sh
Opcional: Mueve el script a un directorio en tu PATH:

bash
Copiar código
sudo mv linkk.sh /usr/local/bin/linkk
Uso
Abrir URLs con un perfil específico
bash
Copiar código
linkk vault gmail t
Esto abrirá las URLs de vault y gmail con el perfil de Chrome t.

Añadir una nueva URL
bash
Copiar código
linkk add-url notion https://www.notion.so
Añadir un nuevo perfil
bash
Copiar código
linkk add-profile dev Profile 6
Listar URLs y seleccionar una
bash
Copiar código
linkk list t
Ejemplos
Abrir una URL específica con un perfil:

bash
Copiar código
linkk gmail p
Abrir varias URLs con un perfil:

bash
Copiar código
linkk vault github grafana t
Añadir una URL y luego abrirla:

bash
Copiar código
linkk add-url jira https://team.atlassian.com/your-work?startRedirect=true
linkk jira t
Personalización
Puedes editar el script para añadir o modificar enlaces y perfiles según tus necesidades.

Contribuciones
Las contribuciones son bienvenidas. Por favor, haz un fork del repositorio y envía un Pull Request.

Licencia
Este proyecto está bajo la Licencia MIT.

markdown
Copiar código

### Paso 4: Subir los Cambios a GitHub

1. **Añadir todos los archivos** al control de versiones:

   ```bash
   git add .
Hacer un commit con un mensaje descriptivo:

bash
Copiar código
git commit -m "Initial commit with script and documentation"
Subir los cambios al repositorio en GitHub:

bash
Copiar código
git push origin main
Paso 5: Mejoras Opcionales
Agregar un archivo .gitignore para evitar subir archivos innecesarios.
Agregar una licencia, como la MIT, si deseas que tu proyecto sea de código abierto.
Paso 6: Compartir y Promover
Comparte el enlace del repositorio en comunidades, redes sociales o en foros donde pueda ser útil para otros.

Siguiendo estos pasos, tendrás un repositorio de GitHub bien estructurado y documentado, lo que facilitará a otros usar y contribuir a tu proyecto.
