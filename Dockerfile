#Simple
#    FROM node:18.20-alpine
#    WORKDIR /app
#    COPY package*.json ./
#    RUN npm install
#    COPY . .
#    EXPOSE 3000
#    CMD ["npm", "start"]

#Like Pro
FROM node:18-alpine AS build
WORKDIR /app
COPY package*.json ./
RUN npm install

FROM node:18-alpine
WORKDIR /app
COPY --from=build /app/node_modules ./node_modules
COPY package*.json ./
COPY app/. .
EXPOSE 3000
CMD ["npm", "start"]