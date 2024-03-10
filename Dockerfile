FROM lawebcapsule/weweb-server:1.0.0

ENV FILES_PATH=/weweb/static/

COPY ./dist/ /weweb/static/