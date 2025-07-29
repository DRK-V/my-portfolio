# Imagen base ligera con Node.js
FROM node:18-alpine

# Crear directorio de trabajo
WORKDIR /app

# Copiar solo lo necesario para instalar dependencias
COPY package.json package-lock.json* ./

# Instalar dependencias
RUN npm install

# Copiar el resto de archivos
COPY . .

# Construir la aplicación para producción
RUN npm run build

# Instalar servidor estático globalmente
RUN npm install -g serve

# Definir el puerto expuesto
EXPOSE 4321

# Configurar la variable de entorno del puerto
ENV PORT=4321

# Comando por defecto para iniciar la app
CMD ["serve", "-s", "dist", "-l", "${PORT}"]
