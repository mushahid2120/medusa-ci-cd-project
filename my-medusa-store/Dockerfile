FROM node:22.16.0-alpine

WORKDIR /app

COPY .medusa/server .

RUN npm install

COPY run_medusa.sh .

EXPOSE 9000

ENV NODE_ENV=production
ENV DATABASE_URL=postgres://$(DATABASE_USERNAME):$(DATABASE_PASSWORD)@$(DATABASE_URL):5432/my-medusa?sslmode=require&rejectUnauthorized=false

ENV REDIS_URL=rediss://$(REDIS_URL):6379
ENV NODE_TLS_REJECT_UNAUTHORIZED=0


ENTRYPOINT [ "./run_medusa.sh" ]

