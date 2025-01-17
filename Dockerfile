FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build
CMD ["npm", "run", "test"]

FROM nginx
COPY --from=builder /app/build  /usr/share/nginx/html
