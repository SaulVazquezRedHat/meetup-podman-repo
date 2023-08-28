#!/bin/bash

# Se instala Podman
yum install podman -y

# Se configuran los registries
echo "unqualified-search-registries = ["quay.io", "registry.access.redhat.com", "registry.redhat.io", "docker.io"]" > /etc/containers/registries.conf

# Se cambia a usuario no-root
echo "redhat" | sudo -S sleep 1 && sudo su - rhel
