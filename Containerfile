FROM registry.access.redhat.com/ubi9/ubi:latest

# Se cambia a usuario root
USER root

# Se crea el grupo developer y el usuario developer asignado al grupo developer
RUN groupadd --system developer && \
	useradd --system --create-home --gid developer developer

# Se instala procps para revisar los procesos con ps
RUN dnf install procps -y && dnf clean all

# Cambiamos a usuario developer
USER developer

# Se cambia el directorio de trabajo
WORKDIR /home/developer

# Se creta archivo con mensaje que se va a mostrar
RUN echo "Esta es mi nueva imagen!" > message

# Se imprime el mensaje y se crea el bash
CMD ["/bin/bash", "-c", "cat message ; bash"]
