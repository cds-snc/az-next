FROM node:lts-alpine
LABEL maintainer="paul.craig@cds-snc.ca"

WORKDIR /app
COPY . .

RUN npm install
RUN npm run build

EXPOSE 80
CMD ["yarn", "start"]
