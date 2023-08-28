#!/bin/bash

# Se instala Podman
yum install podman

# Se configuran los registries
echo "unqualified-search-registries = ["quay.io", "registry.access.redhat.com", "registry.redhat.io", "docker.io"]" > /etc/containers/registries.conf

# Se cambia a usuario no-root
su rhel
cd

# Se limpia terminal
clear
