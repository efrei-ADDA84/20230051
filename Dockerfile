FROM node:latest
WORKDIR /app
COPY package.json package-lock.json /app/
COPY weather.js /app/
RUN npm install
EXPOSE 4000
CMD ["node", "weather.js" ]
