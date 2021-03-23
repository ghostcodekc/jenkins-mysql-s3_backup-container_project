FROM centos:7

RUN yum -y install openssh-server

RUN useradd remote_user && \
    mkdir /home/remote_user/.ssh && \
    chmod 700 /home/remote_user/.ssh && \
    mkdir /var/run/db_backup/ && \
    chown remote_user:remote_user /var/run/db_backup

COPY remote_user_key.pub /home/remote_user/.ssh/authorized_keys
COPY script.sh /var/run/db_backup/script.sh

RUN chown remote_user:remote_user -R /home/remote_user/.ssh/ && \
    chmod 600 /home/remote_user/.ssh/authorized_keys && \
    chmod +x /var/run/db_backup/script.sh

RUN /usr/sbin/sshd-keygen

RUN yum -y install mysql nano

RUN curl -O https://bootstrap.pypa.io/pip/2.7/get-pip.py && \
    python get-pip.py && \
    pip install awscli --upgrade

CMD /usr/sbin/sshd -D
