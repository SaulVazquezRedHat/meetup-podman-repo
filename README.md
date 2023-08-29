
Establecer configuración en caso de que la sesión expire:

yum install podman -y

echo 'unqualified-search-registries = ["quay.io", "registry.access.redhat.com", "registry.redhat.io", "docker.io"]' > /etc/containers/registries.conf

su rhel

cd

podman pull quay.io/rh-ee-savazque/hello-world:latest
