FROM node:16-alpine3.11 As builder

WORKDIR /usr/src/app

COPY package.json package-lock.json ./

RUN npm install

COPY . .

RUN npm run build --prod

FROM nginx:1.15.8-alpine

COPY --from=builder /usr/src/app/dist/sampleApp/ /usr/share/nginx/html



#FROM node:14
#RUN mkdir /usr/src/app
#WORKDIR /usr/src/app
#COPY package.json /usr/src/app
#RUN npm cache clean --force

#RUN npm i
#COPY . .
#RUN ng build --prod

#FROM nginx
#WORKDIR /usr/share/nginx/html
#COPY --from=build /usr/src/app/dist ./

#RUN npm install
#COPY . /usr/src/app
#EXPOSE 4200
#CMD ["npm","start"]







#FROM node as build
#WORKDIR /app
#COPY package.json ./
#COPY package-lock.json ./
#RUN npm install
#COPY . ./
#EXPOSE 4200
#RUN npm install -g @angular/cli@7.3.9
#RUN ng serve
