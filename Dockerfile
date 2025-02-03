# Étape 1 : Build Angular
FROM node:16 AS build
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build --prod

# Étape 2 : Image Nginx
FROM nginx:alpine
COPY --from=build /app/dist/marketplace-front /usr/share/nginx/html

# Ajout du script pour modifier l'API au runtime
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Exposer le port 80
EXPOSE 80

# Lancer le script d'entrée
CMD ["/entrypoint.sh"]

