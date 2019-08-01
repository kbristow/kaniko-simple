FROM gcr.io/kaniko-project/executor:latest

FROM alpine:latest
COPY --from=0 /kaniko /kaniko
RUN ["ln", "-s", "/kaniko/executor", "/usr/local/bin/executor"]
ENV HOME /root
ENV USER /root
ENV PATH /usr/local/bin:/kaniko:/busybox
ENV SSL_CERT_DIR=/kaniko/ssl/certs
ENV DOCKER_CONFIG /kaniko/.docker/
ENV DOCKER_CREDENTIAL_GCR_CONFIG /kaniko/.config/gcloud/docker_credential_gcr_config.json
RUN ["docker-credential-gcr", "config", "--token-source=env"]

ENTRYPOINT [ "/bin/sh" ]