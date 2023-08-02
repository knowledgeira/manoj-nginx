# Use the official nginx image as the base image
FROM nginx:latest

# Install the iproute2 package
RUN apt-get update && apt-get install -y iproute2

# Copy SSL certificate and key to the container
COPY knowledgeira_server.crt /etc/nginx/server.crt
COPY knowledgeira_server.key /etc/nginx/server.key

# Copy the custom nginx configuration
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Copy the script to generate index.html to the container
COPY generate_index.sh /usr/local/bin/

# Set execute permissions for the script
RUN chmod +x /usr/local/bin/generate_index.sh

# Set the default server name
ENV SERVER_NAME knowledgeira.com

# Expose ports 80 (HTTP) and 443 (HTTPS)
EXPOSE 80 443

# Set the entry point to execute the script
ENTRYPOINT ["/usr/local/bin/generate_index.sh"]

