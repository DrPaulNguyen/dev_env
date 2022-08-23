# dev_env
Development environment

# System

## add user

```
adduser --disabled-password --gecos "" --shell /bin/bash ubuntu
adduser ubuntu sudo
adduser ubuntu root
adduser ubuntu docker
```
## remove password for sudo

```
visudo

ubuntu ALL=(ALL) NOPASSWD: ALL
```

## install kubectl

```
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"

sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
```
## install k9s

https://github.com/derailed/k9s/releases/download/v0.25.21/k9s_Linux_x86_64.tar.gz
```
tar xzvf k9s_Linux_x86_64.tar.gz
```
