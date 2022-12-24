FROM debian:bullseye as builder

RUN apt-get update; apt install -y curl unzip
RUN curl -fsSL https://bun.sh/install | bash
ENV PATH /root/.bun/bin:$PATH

#######################################################################

RUN mkdir /app
WORKDIR /app

ENV NODE_ENV production

COPY . .

RUN bun install
FROM debian:bullseye

LABEL fly_launch_runtime="bun"

COPY --from=builder /root/.bun /root/.bun
COPY --from=builder /app /app
COPY index.js /app/index.js

WORKDIR /app
ENV NODE_ENV production
ENV PATH /root/.bun/bin:$PATH

CMD [ "bun", "index.js" ]
