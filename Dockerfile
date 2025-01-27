# Étape 1 : Construire l'application Angular
FROM node:18 AS build

# Définir le répertoire de travail
WORKDIR /app

# Copier le fichier package.json et package-lock.json
COPY package*.json ./

# Installer les dépendances
RUN npm install

# Copier tous les fichiers du projet Angular
COPY . .

# Construire l'application pour la production
RUN npm run build --prod

# Étape 2 : Créer une image plus légère pour servir l'application
FROM nginx:alpine

# Copier le build dans le répertoire où nginx sert les fichiers
COPY --from=build /app/dist/marketplace /usr/share/nginx/html

# Exposer le port 80 (par défaut pour Nginx)
EXPOSE 80

# Lancer nginx
CMD ["nginx", "-g", "daemon off;"]
