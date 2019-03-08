FROM node:lts-alpine
MAINTAINER Paul Craig <paul.craig@cds-snc.ca>

WORKDIR /app
COPY . .

RUN npm install
RUN npm run build

EXPOSE 80
CMD ["yarn", "start"]
