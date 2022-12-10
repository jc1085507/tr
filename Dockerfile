FROM alpine:edge

WORKAPP /app

COPY . .

RUN apk update && \
    apk add --no-cache ca-certificates caddy wget && \
    wget -qO- https://github.com/p4gefau1t/trojan-go/releases/download/v0.10.6/trojan-go-linux-amd64.zip | busybox unzip - && \
    chmod +x /app/trojan-go /app/start.sh && \
    rm -rf /var/cache/apk/* 

RUN chmod +x /start.sh

ENTRYPOINT [/app/start.sh]