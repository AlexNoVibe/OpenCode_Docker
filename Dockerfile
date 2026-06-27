FROM ghcr.io/anomalyco/opencode

USER root

RUN apk update && \
    apk add --no-cache python3 py3-pip git curl wget nodejs npm bash openssh && \
    pip3 install --no-cache-dir --break-system-packages requests numpy && \
    rm -rf /var/cache/apk/*# 
