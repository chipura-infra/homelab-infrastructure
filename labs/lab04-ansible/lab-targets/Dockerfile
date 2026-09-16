FROM debian:12-slim

RUN apt update && apt install -y openssh-server python3 sudo iproute2 && \
    mkdir /var/run/sshd && \
    mkdir -p /root/.ssh && \
    chmod 700 /root/.ssh

RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]
