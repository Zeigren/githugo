# Docker Stack For Deploying A Website Using Hugo And Git

[![DockerHub](https://img.shields.io/docker/cloud/build/zeigren/githugo)](https://hub.docker.com/r/zeigren/githugo)
![Docker Image Size (latest)](https://img.shields.io/docker/image-size/zeigren/githugo/latest)
[![MicroBadger](https://images.microbadger.com/badges/version/zeigren/githugo.svg)](https://microbadger.com/images/zeigren/githugo)
[![MicroBadger](https://images.microbadger.com/badges/commit/zeigren/githugo.svg)](https://microbadger.com/images/zeigren/githugo)
![Docker Pulls](https://img.shields.io/docker/pulls/zeigren/githugo)

## Usage

githugo clones a remote git repository, builds it with [Hugo](https://gohugo.io/), and then hosts it using NGINX.

## Tags (corresponds to Hugo version)

- 0.81.0-r0
- 0.75.1-r0
- 0.71.1-r0

## Stack

- NGINX Alpine
- Alpine - Git/Hugo

## Links

### [Docker Hub](https://hub.docker.com/r/zeigren/githugo)

### [GitHub](https://github.com/Zeigren/githugo)

## Configuration

Configuration consists of environment variables in the `.yml` and `.conf` files.

- website_vhost = The nginx vhost file for your website (templates included, simply replace all instances of `yourdomain.com` and `GIT_REPO_NAME`, use `website_vhost_ssl` if you're using NGINX for SSL termination)
- Make whatever changes you need to the appropriate `.yml` (replace all instances of `yourdomain`, `LINK_TO_GIT_REPO`, `GIT_REPO_NAME`).

### Using A Git Repo With SSH

- ssh_private = SSH Private Key
- ssh_public = SSH Public Key
- remote_ssh = Info from the git remote for the SSH known_hosts file

### Using NGINX for SSL Termination

- yourdomain.com.crt = The SSL certificate for your domain (you'll need to create/copy this)
- yourdomain.com.key = The SSL key for your domain (you'll need to create/copy this)

### [Docker Swarm](https://docs.docker.com/engine/swarm/)

I personally use this with [Traefik](https://traefik.io/) as a reverse proxy, I've included an example `traefik.yml` but it's not necessary.

You'll need to create the appropriate [Docker Secrets](https://docs.docker.com/engine/swarm/secrets/) and [Docker Configs](https://docs.docker.com/engine/swarm/configs/).

Run with `docker stack deploy --compose-file docker-swarm.yml website`

### [Docker Compose](https://docs.docker.com/compose/)

You'll need to create a `config` folder and put the relevant configuration files you created/modified into it.

Run with `docker-compose up -d`. View using `yourdomain.com:9080` or `127.0.0.1:9080`.
