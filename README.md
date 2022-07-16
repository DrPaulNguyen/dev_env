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

visudo

ubuntu ALL=(ALL) NOPASSWD: ALL
