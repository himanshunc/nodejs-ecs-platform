# ---------- Stage 1: Install dependencies ----------
FROM node:20-alpine AS deps

WORKDIR /app

COPY package*.json ./
RUN npm ci


# ---------- Stage 2: Build/Test stage ----------
FROM node:20-alpine AS builder

WORKDIR /app

COPY --from=deps /app/node_modules ./node_modules
COPY . .

RUN npm test


# ---------- Stage 3: Production ----------
FROM node:20-alpine AS runner

WORKDIR /app

ENV NODE_ENV=production
ENV PORT=3000

COPY package*.json ./
RUN npm ci --omit=dev

COPY --from=builder /app/src ./src
COPY --from=builder /app/server.js ./server.js

EXPOSE 3000

CMD ["npm", "start"]