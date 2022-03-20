# Docker Compose
sudo apt --yes --no-install-recommends install curl

mkdir -p ~/.docker/cli-plugins/

# try downlaod via wget to minimize reqs
curl -SL https://github.com/docker/compose/releases/download/v2.2.3/docker-compose-linux-x86_64 -o ~/.docker/cli-plugins/docker-compose
chmod +x ~/.docker/cli-plugins/docker-compose
sudo chown $USER /var/run/docker.sock