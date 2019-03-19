FROM node:lts-alpine
LABEL maintainer="paul.craig@cds-snc.ca"

ARG GITHUB_SHA_ARG=false
ENV GITHUB_SHA=$GITHUB_SHA_ARG

WORKDIR /app
COPY . .

RUN npm install
RUN npm run build

EXPOSE 80
CMD ["yarn", "start"]
