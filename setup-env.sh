#!/bin/bash

# Se instala Podman
yum install podman -y

# Se configuran los registries
echo 'unqualified-search-registries = ["quay.io", "registry.access.redhat.com", "registry.redhat.io", "docker.io"]' > /etc/containers/registries.conf

# Se descarga imagen hello-world
su -c 'podman pull quay.io/rh-ee-savazque/hello-world:latest' rhel

# Se clona el repo del meetup
su -c 'git clone https://github.com/SaulVazquezRedHat/meetup-podman-repo.git /home/rhel/meetup-podman-rhel' rhel
