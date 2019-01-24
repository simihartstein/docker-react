FROM node:alpine AS builder
WORKDIR /app
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# /app/build has the app
FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html
# enginex is started by default in nginx container