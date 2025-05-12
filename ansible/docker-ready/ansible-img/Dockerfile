FROM ubuntu:25.04

# Evita interacción con tzdata y otros paquetes durante la instalación
ENV DEBIAN_FRONTEND=noninteractive

# Instala paquetes necesarios
RUN apt-get update && \
    apt-get install -y openssh-server sudo iproute2 net-tools ansible && \
    #mkdir /var/run/sshd && \
    useradd -m ansible -s /bin/bash && \
    echo 'ansible:ansible' | chpasswd && \
    echo 'ansible ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

RUN echo 'export PS1="\u@\h (\e[1;32mansible\e[0m):\w\$ "' >> /root/.bashrc
RUN echo 'export PS1="\u@\h (\e[1;32mansible\e[0m):\w\$ "' >> /home/ansible/.bashrc
RUN mkdir -p /home/ansible/workspace && chown -R ansible:ansible /home/ansible/workspace

WORKDIR /home/ansible/workspace

VOLUME [ "/home/ansible/workspace" ]

# Expone el puerto SSH
EXPOSE 22

# Inicia el servicio SSH
CMD ["/usr/sbin/sshd", "-D"]