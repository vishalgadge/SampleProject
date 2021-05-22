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
