FROM node as build
WORKDIR /app
COPY package.json ./
COPY package-lock.json ./
RUN npm install
COPY . ./
EXPOSE 4200
RUN npm run build
