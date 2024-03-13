FROM lawebcapsule/weweb-server:1.0.0

# Copy the config file
COPY weweb-server.config.json weweb-server.config.json

# Set the FILES_PATH environment variable
ENV FILES_PATH=./static/:projectId/:filesVersion

# Install jq
RUN apt-get update && apt-get install -y jq

# Extract projectId and filesVersion using jq
RUN jq -r '.designId' weweb-server.config.json > /tmp/projectId.txt \
    && jq -r '.cacheVersion' weweb-server.config.json > /tmp/filesVersion.txt

RUN echo "Final path: ./dist/ /static/$(cat /tmp/projectId.txt)/$(cat /tmp/filesVersion.txt)"

COPY ./dist/ /static/tmp/

RUN mkdir -p /usr/app/weweb-server/static/$(cat /tmp/projectId.txt)/$(cat /tmp/filesVersion.txt) && rm -rf /static/$(cat /tmp/projectId.txt)/$(cat /tmp/filesVersion.txt)/*

RUN mv /static/tmp/* /usr/app/weweb-server/static/$(cat /tmp/projectId.txt)/$(cat /tmp/filesVersion.txt)

#Remove temporary files
RUN rm -rf /tmp
