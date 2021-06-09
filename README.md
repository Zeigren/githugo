# Docker Stack For Deploying A Website Using Hugo And Git

![Docker Image Size (latest)](https://img.shields.io/docker/image-size/zeigren/githugo/latest)
![Docker Pulls](https://img.shields.io/docker/pulls/zeigren/githugo)

## Usage

githugo clones a remote git repository, builds it with [Hugo](https://gohugo.io/), and then hosts it using NGINX. Use [Docker Compose](https://docs.docker.com/compose/) or [Docker Swarm](https://docs.docker.com/engine/swarm/) to deploy. There are examples for using NGINX or Traefik for SSL termination, or don't use SSL at all.

## Tags (corresponds to Hugo version)

- 0.83.1-r1
- 0.82.0-r0
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

- website_nginx.conf = NGINX config file (only needs to be modified if you're using NGINX for SSL termination)
- Make whatever changes you need to the appropriate `.yml` (replace all instances of `yourdomain`, `LINK_TO_GIT_REPO`, `GIT_REPO_NAME`).

### Using A Git Repo With SSH

- ssh_private = SSH Private Key
- ssh_public = SSH Public Key
- remote_ssh = Info from the git remote for the SSH known_hosts file

### Using NGINX for SSL Termination

- yourdomain.test.crt = The SSL certificate for your domain (you'll need to create/copy this)
- yourdomain.test.key = The SSL key for your domain (you'll need to create/copy this)

### [Docker Swarm](https://docs.docker.com/engine/swarm/)

I personally use this with [Traefik](https://traefik.io/) as a reverse proxy, I've included an example `traefik.yml` but it's not necessary.

You'll need to create the appropriate [Docker Secrets](https://docs.docker.com/engine/swarm/secrets/) and [Docker Configs](https://docs.docker.com/engine/swarm/configs/).

Run with `docker stack deploy --compose-file docker-swarm.yml website`

### [Docker Compose](https://docs.docker.com/compose/)

You'll need to create a `config` folder and put `website_nginx.conf` in it, if you're using NGINX for SSL also put your SSL certificate and SSL key in it.

Run with `docker-compose up -d`. View using `yourdomain.test:9080` or `127.0.0.1:9080`.
