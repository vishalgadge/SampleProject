FROM node as build
WORKDIR /app
COPY package.json ./
COPY package-lock.json ./
RUN npm install
COPY . ./
EXPOSE 4200
RUN npm install -g @angular/cli@7.3.9
RUN ng serve
