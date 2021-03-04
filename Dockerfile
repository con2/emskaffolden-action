FROM python:3.9-slim-buster

WORKDIR /usr/src/app

# install kubectl
ADD https://dl.k8s.io/release/v1.20.4/bin/linux/amd64/kubectl /usr/local/bin/kubectl

# install skaffold
ADD https://storage.googleapis.com/skaffold/releases/latest/skaffold-linux-amd64 /usr/local/bin/skaffold

ADD requirements.txt .
RUN chmod 755 /usr/local/bin/kubectl /usr/local/bin/skaffold && \
    pip install -r requirements.txt

ENTRYPOINT ["/usr/local/bin/emskaffolden"]
CMD ["run"]
