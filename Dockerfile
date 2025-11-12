# Utiliser l'image nginx officielle
FROM nginx:latest

# Copier le fichier HTML dans le dossier par défaut de Nginx
COPY index.html /usr/share/nginx/html/

# Exposer le port 80
EXPOSE 80
