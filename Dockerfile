FROM lawebcapsule/weweb-server:1.0.0

# Copy the config file
COPY weweb-server.config.json weweb-server.config.json

# Set the FILES_PATH environment variable
ENV FILES_PATH=./static

COPY ./dist/ ./static/
