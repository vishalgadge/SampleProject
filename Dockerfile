<<<<<<< HEAD
FROM node:14
RUN mkdir /usr/src/app
WORKDIR /usr/src/app
COPY package.json /usr/src/app
RUN npm cache clean --force

RUN npm ci

# HERE I NEED TO RUN ESM COMPILATION

# From this point it is run when application source changes
COPY . .
RUN ng build --prod

FROM nginx:alpine
WORKDIR /usr/share/nginx/html
COPY --from=build /home/node/app/dist ./

#RUN npm install
#COPY . /usr/src/app
#EXPOSE 4200
#CMD ["npm","start"]

=======
#FROM node as build
#WORKDIR /app
#COPY package.json ./
#COPY package-lock.json ./
#RUN npm install
#COPY . ./
#EXPOSE 4200
#RUN npm install -g @angular/cli@7.3.9
#RUN ng serve
>>>>>>> 866814821ed049b29a097908a62d3611452d424d
