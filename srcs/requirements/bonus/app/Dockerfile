FROM alpine:3.19

RUN apk update && apk add --no-cache nodejs

WORKDIR /var/www/html

COPY tools/index.js .
COPY tools/index.html .
COPY tools/main.css .

EXPOSE 4000

CMD ["node", "index.js"]
