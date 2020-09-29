FROM alpine:latest

ARG BRANCH
ARG COMMIT
ARG DATE
ARG URL
ARG VERSION

LABEL org.label-schema.schema-version="1.0" \
    org.label-schema.build-date=$DATE \
    org.label-schema.vendor="Zeigren" \
    org.label-schema.name="zeigren/githugo" \
    org.label-schema.url="https://hub.docker.com/r/zeigren/githugo" \
    org.label-schema.version=$VERSION \
    org.label-schema.vcs-url=$URL \
    org.label-schema.vcs-branch=$BRANCH \
    org.label-schema.vcs-ref=$COMMIT

RUN echo "@edge http://nl.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories \
    && apk --update add --no-cache git less openssh hugo@edge=$VERSION \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /git

COPY docker-entrypoint.sh /

RUN chmod +x /docker-entrypoint.sh

ENTRYPOINT ["/docker-entrypoint.sh"]
