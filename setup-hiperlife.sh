
#VERSION MAC/LINUX
# Nombre del proyecto (puedes pasarlo como argumento)
PROJECT_NAME=${1:-hola01}  # Si no se proporciona argumento, usa "hola01" por defecto

# Paso 1: Asegurar que tenemos la imagen y el directorio
echo "📥 Descargando imagen y preparando directorios..."
docker pull darecfm/hiperlife-app:latest
mkdir -p ~/hiperlife/External

# Paso 2: Inicializar el proyecto
echo "🚀 Inicializando proyecto ${PROJECT_NAME}..."
docker run -it \
  -v ~/hiperlife/External:/home/hl-user/External \
  -v /etc/timezone:/etc/timezone:ro \
  -v /etc/localtime:/etc/localtime:ro \
  -e PROJECT_NAME=${PROJECT_NAME} \
  -e DEBUG_MODE=1 \
  -e NUM_THREADS=-1 \
  -e ENABLE_TESTS=1 \
  -e ENABLE_EXAMPLES=1 \
  darecfm/hiperlife-app:latest /home/hl-user/bin/initHL.sh

# Paso 3: Abrir shell interactiva
echo "🛠️ Abriendo entorno de desarrollo..."
docker run -it \
  -v ~/hiperlife/External:/home/hl-user/External \
  -v /etc/timezone:/etc/timezone:ro \
  -v /etc/localtime:/etc/localtime:ro \
  -e PROJECT_NAME=${PROJECT_NAME} \
  -e DEBUG_MODE=1 \
  -e NUM_THREADS=-1 \
  -e ENABLE_TESTS=1 \
  -e ENABLE_EXAMPLES=1 \
  darecfm/hiperlife-app:latest bash
