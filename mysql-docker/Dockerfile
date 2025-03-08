# Dockerfile
FROM mysql:8

# Copy the SQL dump into the Docker image
COPY shoppingwebsite_backup.sql /docker-entrypoint-initdb.d/

# Set environment variables (optional)
ENV MYSQL_ROOT_PASSWORD=root
ENV MYSQL_DATABASE=shoppingwebsite
ENV MYSQL_USER=admin
ENV MYSQL_PASSWORD=saad123

EXPOSE 3306

