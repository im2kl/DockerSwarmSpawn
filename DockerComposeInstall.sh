# Docker Compose
sudo apt --yes --no-install-recommends install curl

mkdir -p ~/.docker/cli-plugins/

# try downlaod via wget to minimize reqs
sudo curl -SL https://github.com/docker/compose/releases/download/v2.2.3/docker-compose-linux-x86_64 -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
sudo chown $USER /var/run/docker.sock