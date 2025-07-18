FROM node:20-bullseye AS deps

WORKDIR /app
RUN apt-get update && apt-get install -y python3 make g++ bash && rm -rf /var/lib/apt/lists/*
COPY package*.json ./
RUN npm install --legacy-peer-deps

FROM node:20-bullseye
WORKDIR /app
RUN apt-get update && apt-get install -y bash tini postgresql-client && rm -rf /var/lib/apt/lists/*
COPY --from=deps /app/node_modules ./node_modules
COPY . .
COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh
RUN chmod +x /usr/local/bin/docker-entrypoint.sh
EXPOSE 9000
ENTRYPOINT ["/usr/bin/tini", "--"]
CMD ["docker-entrypoint.sh"]

