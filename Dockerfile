# ---- Build stage ----
FROM node:22-alpine AS build
WORKDIR /app

# pnpm
RUN corepack enable
RUN corepack prepare pnpm@latest --activate

# Копируем только package.json + lockfile
COPY package.json pnpm-lock.yaml ./
RUN pnpm install --frozen-lockfile

# Копируем исходники
COPY . .

# Билдим проект
RUN pnpm build

# ---- Run stage ----
FROM node:22-alpine AS run
WORKDIR /app

RUN corepack enable
RUN corepack prepare pnpm@latest --activate

COPY --from=build /app/dist ./dist

EXPOSE 8080
CMD ["pnpm", "dlx", "serve", "-s", "dist", "-l", "8080"]
