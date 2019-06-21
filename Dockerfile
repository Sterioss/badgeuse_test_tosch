FROM keymetrics/pm2:latest-alpine

# Bundle APP files
COPY ./index.js src/
COPY ./package.json .
COPY ./server src/server/
COPY pm2.json .

# Install app dependencies
ENV NPM_CONFIG_LOGLEVEL warn
RUN npm install --production

# Show current folder structure in logs
RUN ls -al -R

CMD [ "pm2-runtime", "start", "pm2.json" ]

