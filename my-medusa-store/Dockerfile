FROM node:22.16.0-alpine

WORKDIR /app

COPY .medusa/server .

RUN npm install 

COPY .env .

COPY medusa-config.ts .

COPY run_medusa.sh .

EXPOSE 9000

ENV NODE_ENV=production

ENV NODE_TLS_REJECT_UNAUTHORIZED=0


ENTRYPOINT [ "./run_medusa.sh" ]

