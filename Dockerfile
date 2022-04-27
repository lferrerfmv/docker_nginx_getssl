# syntax=docker/dockerfile:1
FROM nginx:1.21.6-alpine
RUN apk update
RUN apk add --no-cache curl
WORKDIR /getssl
RUN apk add --no-cache openssl
RUN apk add --no-cache expect
RUN apk add --no-cache bind-tools
RUN apk add --no-cache openssh-client
RUN curl --silent https://raw.githubusercontent.com/lferrerfmv/getssl/latest/getssl > /getssl/getssl
RUN curl --silent https://raw.githubusercontent.com/lferrerfmv/watchguard-letsencrypt-deploy/master/push-le-cert.sh > /getssl/push-le-cert.sh
RUN apk cache clean
RUN chmod 755 /getssl/getssl
RUN chmod 755 /getssl/push-le-cert.sh
RUN ./getssl -u
RUN chmod 755 /getssl/getssl
RUN rm getssl.*
WORKDIR /tmp_getssl
RUN cp -r /getssl /tmp_getssl/
WORKDIR /getssl
ENTRYPOINT ["/docker-entrypoint.sh"]
