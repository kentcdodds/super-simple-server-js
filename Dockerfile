FROM denoland/deno:alpine-1.29.1

EXPOSE 8080

WORKDIR /app

USER deno

COPY . .

CMD ["run","--allow-net","--allow-env","index.js"]