# Usar una imagen base oficial de Node.js
FROM node:18-alpine

# Establecer el directorio de trabajo dentro del contenedor
WORKDIR /app

# Copiar los archivos necesarios para instalar las dependencias
COPY package.json package-lock.json* ./

# Instalar dependencias
RUN npm install

# Copiar el resto del código de la aplicación
COPY . .


# Construir la aplicación para producción
RUN npm run build

# Instalar un servidor estático para servir el build
RUN npm install -g serve

# Exponer el puerto (Render asigna el valor de la variable $PORT)
EXPOSE 4321

# Configurar la variable de entorno que Render usará
ENV PORT=4321

# Comando por defecto para servir el contenido estático generado
CMD ["sh", "-c", "serve -s dist -l ${PORT:-4321}"]
