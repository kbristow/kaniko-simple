FROM gcr.io/kaniko-project/executor:latest

FROM alpine:latest
COPY --from=0 /kaniko/executor /usr/local/bin/executor

ENTRYPOINT [ "/bin/sh" ]