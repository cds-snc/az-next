# Next Hello

This is a tiny proof-of-concept app to trial Azure container deployments.

## Getting started

### [Install `npm`](https://www.npmjs.com/get-npm)

`npm` is a javascript package manager. It downloads project dependencies and runs node applications.

### [Install `docker`](https://docs.docker.com/install/)

A docker container allows a developer to package up an application and all of its parts. This means we can build an app in any language, in any stack, and then run it anywhere — whether locally or on a server.

## Build and run with npm

```bash
# install dependencies
npm install

# run application in 'dev' mode
npm run dev

# run application in 'prod' mode
npm run build && npm start
```

On a Mac, press `Control` + `C` to quit the running application.

### Run tests with npm

```bash
# run unit tests
npm run test

# run code linter
npm run lint
```

## Build and run as a Docker container

```bash
# build an image locally
docker build -t cdssnc/az-next .

# run the container
docker run -it -p 80:80 cdssnc/az-next
```

On a Mac, press `Control` + `C` to quit the running docker container.
