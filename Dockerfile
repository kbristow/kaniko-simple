FROM gcr.io/kaniko-project/executor:latest

FROM alpine:latest
COPY --from=0 /kaniko /kaniko
ENV HOME /root
ENV USER /root
ENV PATH "/kaniko:${PATH}"
ENV SSL_CERT_DIR=/kaniko/ssl/certs
ENV DOCKER_CONFIG /kaniko/.docker/
ENV DOCKER_CREDENTIAL_GCR_CONFIG /kaniko/.config/gcloud/docker_credential_gcr_config.json
RUN ["docker-credential-gcr", "config", "--token-source=env"]

ENTRYPOINT [ "/bin/sh" ]