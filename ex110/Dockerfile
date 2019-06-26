FROM node:10-stretch

RUN mkdir /code
WORKDIR /code
COPY . /code/
RUN npm install
EXPOSE 5000
CMD ["npm", "start"]