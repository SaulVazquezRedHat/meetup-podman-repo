# Podman - with Interactive Labs
**Image Repositories** 
-----------------------

### Revisar UI de registry.access.redhat.com y quay.io

Vamos a revisar los siguientes registries:

**Red Hat Quay.io**:

[https://quay.io/repository/](https://quay.io/repository/)

**Docker Hub**:

[https://hub.docker.com/search?q=](https://hub.docker.com/search?q=)

**Red Hat Certified container images**:

[https://catalog.redhat.com/software/containers/search](https://catalog.redhat.com/software/containers/search)

![](api/images/bToPdJFfKHwv/image.png)

![](api/images/tGZy1VXws4Sb/image.png)

![](api/images/rrfXzY8OH7e3/image.png)

Registries proporcionados por Red Hat:

[https://access.redhat.com/RegistryAuthentication](https://access.redhat.com/RegistryAuthentication)

| Registry | Content | Supports  <br>unauthenticated access | Supports  <br>Red Hat login | Supports  <br>registry tokens |
| --- | --- | --- | --- | --- |
| registry.access.redhat.com | Red Hat products | Yes | No  | No  |
| registry.redhat.io | Red Hat products | No  | Yes | Yes |
| registry.connect.redhat.com | Third-party products | No  | Yes | Yes |

If you do not have a Red Hat account, you can get a free Red Hat account by signing up for one of the following:

*   [Red Hat Developer Program](https://developers.redhat.com): Signing up for a free developer account gives you access to developer tools and programs.
*   [30-day Trial Subscription](https://access.redhat.com/products/red-hat-enterprise-linux/evaluation): Signing for a 30-day trial subscription gives you access to selected Red Hat software products.

### Crear cuenta en Quay.io

Vamos a crear una cuenta en quay.io

Vamos a Quay.io

![](api/images/qDjaE4wFQact/image.png)

Click en la parte superior derecha en **SIGN IN**

Va a redirigir a la página de Log in de Red Hat. Si aún no se tiene una cuenta de Red Hat, podemos crear una.

![](api/images/E7imuSIQOe4v/image.png)

Y llenamos los datos indicados. Basta con ingresar solo los obligatorios.

![](api/images/nGMYfg4nE0z0/image.png)

![](api/images/Y3ijnEUOPAJp/image.png)

Y click en **Create my account** para generar la nueva cuenta.

![](api/images/2rkiMuKyZYhR/image.png)

Nos va a regresar a la página de Quay.io, para solicitarnos resolver un reCAPTCHA. Lo resolvemos.

![](api/images/lA7Hi0LxZDRT/image.png)

Vamos a poder definir el nombre de usuario para Quay.io

![](api/images/bVU1kQq1dsDe/image.png)

Para comenzar a trabajar con imágenes, necesitamos configurar una contraseña. 

Dentro de la pagina de repositorios, seleccionamos el usuario que se acaba de crear, en la parte derecha debajo de **Users and Organizations**

![](api/images/cfPfwmHMRA6C/image.png)

Click sobre el icono de los engranes, en la parte izquierda, para ir a la sección **User Settings**. Ahí vamos a crear una contraseña.

![](api/images/UU8XMIl3ofyH/image.png)

Y vamos a crear una nueva contraseña:

![](api/images/KVLQvRtOoQxd/image.png)

Y listo. Ya podemos comenzar a subir nuestras propias imágenes a Quay.io.

**Hello world con containers**
------------------------------

### Solicitar instancia de RHEL en Red Hat interactive labs

Vamos a generar el laboratorio interactivo donde vamos a desarrollar el workshop.

Vamos a:

[https://www.redhat.com/en/interactive-labs/red-hat-enterprise-linux-open-lab](https://www.redhat.com/en/interactive-labs/red-hat-enterprise-linux-open-lab)

Y damos click en **Launch**.

![](Podman%20-%20with%20Interactive%20Labs/image.png)

![](Podman%20-%20with%20Interactive%20Labs/9_image.png)

Va a tardar cerca de minuto y medio en generarse y nos va a mostrar la terminal en un laboratorio interactivo con RHEL 9 que **tiene un tiempo de vida de 60 minutos**.

Click en **Start**

![](Podman%20-%20with%20Interactive%20Labs/10_image.png)

Minimizamos la ventana de instrucciones.

![](Podman%20-%20with%20Interactive%20Labs/11_image.png)

![](Podman%20-%20with%20Interactive%20Labs/12_image.png)

### Instalación de Podman

Podemos ver las instrucciones de instalación en la página de Podman.

[https://podman.io/docs/installation](https://podman.io/docs/installation)

En este caso, como estamos trabajando con RHEL 9, por lo que lo podemos instalar con:

Vemos que el usuario con el que se esta trabajando es root, entonces instalamos Podman con los siguientes comandos:

```text-plain
yum install podman
```

Aceptamos la instalación escribiendo: **y**

![](Podman%20-%20with%20Interactive%20Labs/1_image.png)

![](Podman%20-%20with%20Interactive%20Labs/2_image.png)

Confirmamos la instalación de podman revisando su versión.

![](Podman%20-%20with%20Interactive%20Labs/3_image.png)

### _podman search_

Podemos buscar alguna imagen desde la terminal con `podman search` en los registries que se encuentran registrados en `/etc/containers/registries.conf`

Por ejemplo:

```text-plain
cat /etc/containers/registries.conf
```

![](Podman%20-%20with%20Interactive%20Labs/4_image.png)

Vamos a agregar Quay.io:

```text-plain
vim /etc/containers/registries.conf
```

![](Podman%20-%20with%20Interactive%20Labs/5_image.png)

```text-plain
unqualified-search-registries = ["quay.io", "registry.access.redhat.com", "registry.redhat.io", "docker.io"]
```

Guardamos y salimos con **:wq**

Cambiamos al usuario non-root, **rhel**

```text-plain
su rhel
cd
```

![](Podman%20-%20with%20Interactive%20Labs/13_image.png)

Ahora podemos hacer una búsqueda sobre los registries desde la CLI de podman. 

Por ejemplo:

```text-plain
podman search python
```

![](Podman%20-%20with%20Interactive%20Labs/6_image.png)

### _podman login_

Podemos iniciar sesión sobre un registry, para poder subir nuestras imágenes personalizadas. 

```text-plain
podman login quay.io
```

Y ponemos usuario y contraseña.

![](Podman%20-%20with%20Interactive%20Labs/7_image.png)

La contraseña puede ser sustituida por un token temporal.

![](api/images/QJD9eMxECgDi/image.png)

Escribimos la contraseña y verificamos.

![](api/images/RPuPrptfln4y/image.png)

Y va a arrojar el usuario y contraseña encriptada para iniciar sesión desde una CLI.

![](api/images/hCuWF702WUOp/image.png)

### _podman logout_

Vimos como iniciar sesión desde la CLI. Para cerrar sesión, lo podemos hacer con `podman logout`.

Por ejemplo:

```text-plain
podman logout quay.io
```

![](Podman%20-%20with%20Interactive%20Labs/8_image.png)

### _podman pull_

Vamos a descargar una imagen con la que se va a estar trabajando y haciendo pruebas. La vamos a descargar de

[https://quay.io/repository/rh-ee-savazque/hello-world](https://quay.io/repository/rh-ee-savazque/hello-world)

![](api/images/2EciwDcbBbFD/image.png)

Donde podemos encontrar en la parte inferior derecha el comando para hacerle pull a la imagen con podman y con docker. En este caso nos interesa la opción de podman. Que vemos que lo hace con `podman pull`

```text-plain
podman pull quay.io/rh-ee-savazque/hello-world:latest
```

![](api/images/8V6flAoPB0ME/image.png)

![](Podman%20-%20with%20Interactive%20Labs/14_image.png)

### _podman images_

Podemos consultar todas las imágenes locales que tenemos con el comando `podman images`. Nos va a devolver todas las imágenes que hemos descargado e imágenes personales que hemos descargado. 

En este caso, si queremos visualizar la imagen de hello-world que hemos descargado lo podemos hacer con este comando.

```text-plain
podman images
```

![](Podman%20-%20with%20Interactive%20Labs/15_image.png)

### _podman rmi_

Podemos borrar cualquier imagen con `podman rmi <IMAGE ID>`. Con el siguiente comando podemos borrar la imagen `hello-world` que acabamos de descargar.

Podemos borrarla con cualquiera de las siguientes dos formas:

```text-plain
podman rmi quay.io/rh-ee-savazque/hello-world
```

o 

```text-plain
podman rmi 781f92ea81ad
```

![](Podman%20-%20with%20Interactive%20Labs/16_image.png)

Podemos volver a descargar la imagen para seguir trabajando con ella.

```text-plain
podman pull quay.io/rh-ee-savazque/hello-world
```

### podman run

Finalmente, para crear un contenedor a partir de una imagen, podemos hacerlo con `podman run`. Este comando nos ofrece varias parámetros para configurar el despliegue de nuestros contenedores. Para consultar su manual completo lo podemos hacer con

```text-plain
man podman-run
```

![](Podman%20-%20with%20Interactive%20Labs/17_image.png)

Así mismo, este comando se puede variar para obtener información del manual de cualquier comando de podman.

Para correr este comando ejecutamos el siguiente comando.

```text-plain
podman run hello-world:latest
```

![](Podman%20-%20with%20Interactive%20Labs/18_image.png)

Y listo. Hemos corrido nuestro primer contenedor.

También podemos ponerle un nombre, con la opción `--name`

```text-plain
podman run --name my-container hello-world:latest
```

Y también podemos acceder al contenedor a través de una terminal que mantendrá el contenedor corriendo hasta que salgamos, con la opción `-it` que nos habilita un terminal interactiva. 

```text-plain
podman run -it --name my-container hello-world:latest
```

![](Podman%20-%20with%20Interactive%20Labs/19_image.png)

**Container lifecycle**
-----------------------

### podman ps

Con podman ps podemos ver todos los contenedor que actualmente están corriendo. En este caso, como no hay ninguno corriendo no nos va  devolver nada.

![](Podman%20-%20with%20Interactive%20Labs/20_image.png)

Y si queremos ver todos los contenedores, incluyendo los que no se encuentran corriendo, podemos hacerlo con

```text-plain
podman ps --all
```

![](Podman%20-%20with%20Interactive%20Labs/21_image.png)

Y vemos que su estatus es `Exited(0)`, porque cuando lo corrimos, comenzó a ejecutar su tarea, que era el de imprimir un mensaje de `“Hello world!”` y luego terminó. 

### podman create

podman create nos permite crear un contenedor pero **sin iniciarlo**. Por ejemplo:

```text-plain
podman create --name my-not-started hello-world:latest echo "Container started"
```

![](Podman%20-%20with%20Interactive%20Labs/22_image.png)

### podman start

Y podemos iniciarlo con el comando `podman start`. Y podemos verificar que se haya imprimido el mensaje revisando antes y después los logs, con `podman logs`

```text-plain
podman logs my-not-started
```

```text-plain
podman start my-not-started
```

```text-plain
podman logs my-not-started
```

![](Podman%20-%20with%20Interactive%20Labs/23_image.png)

### podman stop

Podemos dejar un contenedor corriendo en un segundo plano, en modo detached, agregando la opción `--detach` o `-d` a `podman run`.

En este caso, para modificar el comportamiento del contenedor, vamos a pasar un comando al final para alargar su vida 100 segundo.

```text-plain
podman run -d hello-world:latest sleep 180
```

![](Podman%20-%20with%20Interactive%20Labs/24_image.png)

Y si queremos detenerlo, podemos hacer con el comando `podman stop`

```text-plain
podman ps
podman stop <CONTAINER_ID>
podman ps
```

![](Podman%20-%20with%20Interactive%20Labs/25_image.png)

### podman restart

Podemos utilizar el comando `podman restart` para reiniciar un contenedor detenido.

![](api/images/YakzQtzvqqVA/image.png)

Para iniciar un contenedor detenido, solo basta con pasar el nombre o el ID del contenedor. Podemos consultarlos con `podman ps -a`

```text-plain
podman ps --all
```

```text-plain
podman restart <CONTAINER_ID>
podman ps
```

![](Podman%20-%20with%20Interactive%20Labs/26_image.png)

### podman rm

Con este comando, podemos borrar un contenedor detenido. Y con la opción `-f`, podemos forzar que un contenedor que esta detenido se elimine. Por ejemplo.

```text-plain
podman run --name para-borrar hello-world:latest
podman ps -a
```

![](Podman%20-%20with%20Interactive%20Labs/27_image.png)

```text-plain
podman rm para-borrar
podman ps -a
```

![](Podman%20-%20with%20Interactive%20Labs/28_image.png)

También se puede borrar por su ID.

### podman inspect

Con este comando podemos consultar los metadatos del container.

```text-plain
podman ps -a
podman inspect <CONTAINER_ID>
```

![](Podman%20-%20with%20Interactive%20Labs/29_image.png)

### podman exec

Con el comando `podman exec` podemos correr un comando dentro de un contenedor que esta corriendo.

Por ejemplo:

```text-plain
podman run -d --name container-for-exec hello-world:latest sleep 180
podman ps
podman exec container-for-exec ps
```

![](Podman%20-%20with%20Interactive%20Labs/30_image.png)

O también podemos abrir una terminal

```text-plain
podman exec -it container-for-exec /bin/bash
```

![](Podman%20-%20with%20Interactive%20Labs/31_image.png)

**Build image**
---------------

### podman commit

Podemos crear una nueva imagen, a partir de un contenedor en su estado actual, con podman commit.

Ejemplo:

La imagen **hello-world** con la que hemos estado trabajando, imprime el mensaje `Hello world!` desde un archivo que se llama **message** que se encuentra en `/home/developer`. Por lo que lo que ahora vamos a hacer es modificar este archivo de un contenedor y crear una imagen a partir de este contenedor. 

Primero, creamos un contenedor y lo abrimos desde su terminal.

```text-plain
podman run -it --name container-to-change hello-world:latest
```

![](Podman%20-%20with%20Interactive%20Labs/32_image.png)

Y ya estamos dentro dell contenedor corriendo. Ahora si corremos un ls podemos ver un archivo que se llama **message** y revisamos su contenido.

```text-plain
ls
cat message
```

![](Podman%20-%20with%20Interactive%20Labs/33_image.png)

Ahora, modificamos su contenido.

```text-plain
echo "Hello world from my container!" > message
cat message
```

![](Podman%20-%20with%20Interactive%20Labs/34_image.png)

Y salimos del contenedor.

```text-plain
exit
```

![](api/images/q94M8c7xXIOM/image.png)

Revisamos el contenedor:

```text-plain
podman ps -a
```

![](Podman%20-%20with%20Interactive%20Labs/35_image.png)

Ahora vamos a crear una imagen a partir de este contenedor.

```text-plain
podman commit <CONTAINER> <NEW_IMAGE_NAME>:<TAG>
```

```text-plain
podman commit container-to-change my-new-hello-world:latest
podman images
```

![](Podman%20-%20with%20Interactive%20Labs/36_image.png)

Y ahora podemos correr un contenedor generado a partir de esta nueva imagen con el mensaje actualizado.

```text-plain
podman run my-new-hello-world:latest
```

![](Podman%20-%20with%20Interactive%20Labs/37_image.png)

### Containerfile (DIAPOSITIVAS)

Este es el Containerfile con el que fue creada la imagen hello-world con la que hemos estado trabajando.

```text-plain
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
RUN echo "Hello world!" > message

# Se imprime el mensaje y se crea el bash
CMD ["/bin/bash", "-c", "cat message ; bash"]
```

También se puede encontrar en el siguiente gist:

[https://gist.github.com/SaulVazquezRedHat/ba7be89c08a666ddd437f62e1c6c0d2c](https://gist.github.com/SaulVazquezRedHat/ba7be89c08a666ddd437f62e1c6c0d2c)

### Parámetros basicos de Containerfile

**FROM**

La instrucción FROM inicializa una nueva etapa de construcción y establece la **imagen base** para las instrucciones posteriores.

**USER**

La instrucción USER establece el nombre de usuario (o UID) y, opcionalmente, el grupo de usuarios (o GID) que se utilizará como usuario y grupo por defecto durante el resto de la etapa actual.

**RUN**

La instrucción RUN ejecutará cualquier comando en una nueva capa sobre la imagen actual y hará commit del estado resultado de la operación. La imagen commiteada resultante se utilizará para el siguiente paso en el Containerfile.

**WORKDIR**

La instrucción WORKDIR establece el directorio de trabajo para cualquier instrucción RUN, CMD, ENTRYPOINT, COPY y ADD que le siga en el Containerfile.

**CMD**

El propósito principal de un CMD es proporcionar valores por defecto para un contenedor en ejecución. Estos valores predeterminados pueden incluir un ejecutable, o pueden omitir el ejecutable, en cuyo caso debe especificar también una instrucción ENTRYPOINT.

Sólo puede haber una instrucción CMD en un Dockerfile. Si enumera más de un CMD, solo tendrá efecto el último CMD.

**COPY**

La instrucción COPY copia nuevos archivos o directorios de <src> y los añade al sistema de archivos del contenedor en la ruta <dest>.

**ENV**

La instrucción ENV establece la variable de entorno <key> al valor <value>.

**ARG**

La instrucción ARG define una variable que los usuarios pueden pasar en tiempo de construcción al constructor con el comando docker build usando la bandera --build-arg <varname>=<value>.

### podman build (pequeña modificación al mensaje de Hello world)

Vamos a crear un archivo llamado Containerfile para crear una imagen a partir de esta.

```text-plain
touch Containerfile
vim Containerfile
```

Y le vamos a pegar el contenido del siguiente gist:

[https://gist.github.com/SaulVazquezRedHat/ba7be89c08a666ddd437f62e1c6c0d2c](https://gist.github.com/SaulVazquezRedHat/ba7be89c08a666ddd437f62e1c6c0d2c)

![](api/images/vu28CEp2eYqs/image.png)

Y vamos a modificar el mensaje que se imprime, por ejemplo, modificamos **Hello world!** a **Esta es mi nueva imagen!** reemplazando el mensaje en la última instrucción **RUN**.

```text-plain
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
```

Guardamos con **:wq**

![](Podman%20-%20with%20Interactive%20Labs/38_image.png)

Y ahora vamos a construir una imagen a partir de este Containerfile.

```text-plain
podman build -t quay.io/<QUAY_USERNAME>/my-hello-world:latest -f Containerfile
```

Por ejemplo:

```text-plain
podman build -t quay.io/rh-ee-savazque/my-hello-world:latest -f Containerfile
```

![](Podman%20-%20with%20Interactive%20Labs/39_image.png)

Revisamos con:

```text-plain
podman images
```

![](Podman%20-%20with%20Interactive%20Labs/40_image.png)

Y creamos un contenedor de esta imagen nueva.

```text-plain
podman run --rm -it my-hello-world:latest
```

![](Podman%20-%20with%20Interactive%20Labs/41_image.png)

E revisamos el contenido del archivo

```text-plain
cat message
```

![](Podman%20-%20with%20Interactive%20Labs/42_image.png)

### _podman history_

Con podman history podemos ver el historial de cambios que ha tenido esta imagen.

```text-plain
podman history hello-world
```

![](Podman%20-%20with%20Interactive%20Labs/43_image.png)

Si queremos ver solo las instrucciones

```text-plain
podman history --no-trunc --format "{{.CreatedBy}}" my-hello-world:latest
```

![](Podman%20-%20with%20Interactive%20Labs/44_image.png)

### podman push

Ahora vamos a subir nuestra imagen a el registry Quay.io

Primero hacemos log in

```text-plain
podman login quay.io
```

![](Podman%20-%20with%20Interactive%20Labs/45_image.png)

Y ahora subimos la imagen

```text-plain
podman push quay.io/<QUAY_USERNAME>/my-hello-world:latest
```

Por ejemplo:

```text-plain
podman push quay.io/rh-ee-savazque/my-hello-world:latest
```

![](Podman%20-%20with%20Interactive%20Labs/46_image.png)

Y por default se crea como privado

![](api/images/P2FbRrDCAWQ1/image.png)

### podman save

Podemos guardar una imagen completa en un archivo tar con **podman save**

Por ejemplo, revisamos las imágenes que hay

```text-plain
podman images
```

![](Podman%20-%20with%20Interactive%20Labs/47_image.png)

Vamos a guardar la imagen **quay.io/rh-ee-savazque/my-hello-world:latest** en el archivo **my-saved-image.tar**

```text-plain
podman save --output my-saved-image.tar quay.io/rh-ee-savazque/my-hello-world:latest
```

```text-plain
ls
```

![](Podman%20-%20with%20Interactive%20Labs/48_image.png)

### podman load

Ahora vamos a borrar la imagen local.

```text-plain
podman rmi quay.io/rh-ee-savazque/my-hello-world:latest
podman images
```

Vamos a cargar el la imagen del archivo **my-saved-image.tar**

```text-plain
podman load --input my-saved-image.tar
podman images
```

![](Podman%20-%20with%20Interactive%20Labs/49_image.png)

Y podemos correr la imagen.

```text-plain
podman run quay.io/rh-ee-savazque/my-hello-world:latest
```

![](Podman%20-%20with%20Interactive%20Labs/50_image.png)