FROM node:20-alpine
WORKDIR /app
COPY package*.json ./
COPY server.js ./
RUN addgroup -g 1001 -S app && adduser -u 1001 -S app -G app
USER app
EXPOSE 3000
HEALTHCHECK --interval=30s --timeout=3s CMD wget -qO- http://localhost:3000/health || exit 1
CMD ["node", "server.js"]
