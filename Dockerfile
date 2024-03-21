FROM node:20

WORKDIR /app

COPY package.json ./

RUN npm install

CMD ["npm", "start"]

# docker build -t poc .
# docker run -p 3000:3000 -v /app/node_modules -v ./:/app poc
