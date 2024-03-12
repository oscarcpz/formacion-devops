FROM debian

ARG USERNAME=ansibleuser
ARG USER_UID=1000
ARG USER_GID=$USER_UID

RUN apt update && apt install -y iputils-ping openssh-server
#ADD sshd_config /etc/ssh

# Create the user
RUN groupadd --gid $USER_GID $USERNAME \
    && useradd --uid $USER_UID --gid $USER_GID -m $USERNAME \
    && echo "ansibleuser:1234" | chpasswd \
    #
    # Add sudo support
    && apt-get update \
    && apt-get install -y sudo \
    && echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME \
    && chmod 0440 /etc/sudoers.d/$USERNAME

EXPOSE 22

CMD ["service", "ssh", "start"]