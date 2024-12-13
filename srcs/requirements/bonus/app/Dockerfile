FROM alpine:3.19

RUN apk update && apk add --no-cache nodejs

COPY . .

EXPOSE 4000

CMD ["node", "tools/index.js"]
