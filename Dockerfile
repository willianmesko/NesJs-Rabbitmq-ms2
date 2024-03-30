#prod stage
FROM node:18-alpine 

WORKDIR /usr/src/app

ARG NODE_ENV=production
ENV NODE_ENV=${NODE_ENV}

COPY --from=build /usr/src/app/ ./dist

COPY package*.json ./

RUN npm install -g pm2

RUN npm install --only=production

RUN rm package*.json

EXPOSE 4000

CMD ["pm2 start", "dist/main.js"]
