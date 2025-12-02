echo "archivo de configuración"
ARCHIVO_CONFIG=~/.ssh/config

echo "archivo donde ubicar la llave"
ARCHIVO_LLAVE_SSH=~/.ssh/id_test

echo "Configuración de git"
NOMBRE_GITHUB="test"
CORREO_GITHUB="victorpinto@unimayor.edu.co"

echo "Configurando usuario y correo en git local; importante para hacer commits"
git config --global user.name "${NOMBRE_GITHUB}"
git config --global user.email "${CORREO_GITHUB}"


echo "-------------------------"
echo "Listando la configuración de git para ver que todo funciona bien"

git config --list
echo "-------------------------"

echo "Listando la configuración de git para ver que todo funciona bien"
 
ssh-keygen -f "${ARCHIVO_LLAVE_SSH}" -t ed25519 -C "${CORREO_GITHUB}"

echo "Copie y pegue la siguiente llave en su github -> settings -> SSH and GPG Keys"
echo "-------------------------"
cat "${ARCHIVO_LLAVE_SSH}.pub"
echo "-------------------------"

# Comprobar si existe
if [ -f "$ARCHIVO_CONFIG" ]; then
  echo "El archivo config existe actualizando la configuración"

else
  echo "El archivo config no existe creando archivo e incluyendo la configuración"
  touch ${ARCHIVO_CONFIG}
fi

cat ./config-template.txt >> ${ARCHIVO_CONFIG}
