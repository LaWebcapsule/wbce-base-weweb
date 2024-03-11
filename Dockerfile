FROM lawebcapsule/weweb-server:1.0.0

COPY weweb-server.config.json weweb-server.config.json

ENV FILES_PATH=/weweb/static

COPY ./dist/ /weweb/static/