# Stage 1, build the static files
FROM ubuntu:latest as builder

RUN mkdir -p /app
WORKDIR /app

RUN apt update && apt install -y hugo

COPY . /app

RUN hugo

FROM nginx:latest 

WORKDIR /usr/share/nginx/html

COPY --from=builder /app/public/ .

RUN ls -lA .