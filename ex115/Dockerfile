FROM node:10-stretch
RUN mkdir /code
WORKDIR /code/
COPY backend /code/
WORKDIR /code/backend/
RUN npm install
WORKDIR /code/
EXPOSE 4000
CMD [ "npm", "start" ]
