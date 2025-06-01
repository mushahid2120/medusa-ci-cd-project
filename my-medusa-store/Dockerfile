FROM node:22.16.0-alpine

WORKDIR /app

COPY .medusa/server .

RUN npm install

COPY run_medusa.sh .

EXPOSE 9000

ENV NODE_ENV=production
ENV DATABASE_URL=postgres://mushahid:Redhat123@database-medusa.czyw2i6s00lx.ap-south-1.rds.amazonaws.com:5432/my-medusa?sslmode=require&rejectUnauthorized=false
ENV REDIS_URL=rediss://clustercfg.my-redis-medusa.ltqem0.aps1.cache.amazonaws.com:6379
ENV NODE_TLS_REJECT_UNAUTHORIZED=0


ENTRYPOINT [ "./run_medusa.sh" ]

