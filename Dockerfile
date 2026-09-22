FROM node:18-alpine

ENV NODE_ENV=production
EXPOSE 8080/tcp

LABEL maintainer="Mercury Workshop"
LABEL summary="Scramjet Demo Image"
LABEL description="Example application of Scramjet"

WORKDIR /app

RUN apk add --upgrade --no-cache python3 make g++
RUN npm install -g pnpm

COPY ["package.json", "pnpm-lock.yaml", "./"]
RUN pnpm install --frozen-lockfile --pm-on-fail=ignore

COPY . .

ENTRYPOINT [ "node" ]
CMD ["src/index.js"]
