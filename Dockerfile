FROM alpine:3.14

RUN    apk add --no-cache bash curl dumb-init jq
RUN    curl -L -o /get.sh https://raw.githubusercontent.com/eteu-technologies/amqp-deployer/master/scripts/get.sh \
    && chmod +x /get.sh \
    && /get.sh run-deploy \
    && mv run-deploy /usr/local/bin/ \
    && rm /get.sh

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/usr/bin/dumb-init", "--", "/entrypoint.sh"]
