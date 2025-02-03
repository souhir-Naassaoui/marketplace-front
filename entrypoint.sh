#!/bin/sh

# Remplacer l'URL de l'API dans les fichiers JS d'Angular
sed -i "s|http://localhost:8080/api/products|${API_URL}|g" /usr/share/nginx/html/main.*.js

# Lancer nginx
exec nginx -g "daemon off;"
