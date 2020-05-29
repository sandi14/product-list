FROM node:10.15.3

#RUN mkdir -p /usr/app
WORKDIR /usr/src/app
COPY package*.json ./
COPY src ./src
RUN npm install


EXPOSE 2000
CMD npm start
