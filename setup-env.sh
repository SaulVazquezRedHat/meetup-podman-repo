#!/bin/bash

# Se instala Podman
yum install podman -y

# Se configuran los registries
echo "unqualified-search-registries = ["quay.io", "registry.access.redhat.com", "registry.redhat.io", "docker.io"]" > /etc/containers/registries.conf

# Se descarga imagen hello-world
podman pull quay.io/rh-ee-savazque/hello-world:latest

# Se clona el repo del meetup
git clone https://github.com/SaulVazquezRedHat/meetup-podman-repo.git /home/rhel/

# Se cambia a usuario no-root
echo "redhat" | sudo -S sleep 1 && sudo su - rhel
