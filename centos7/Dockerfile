FROM centos

RUN yum -y install openssh-server

RUN useradd remote_user && \
    mkdir /home/remote_user/.ssh && \
    chmod 700 /home/remote_user/.ssh && \
    mkdir /var/run/db/ && \
    chown remote_user:remote_user /var/run/db

COPY remote_user_key.pub /home/remote_user/.ssh/authorized_keys
COPY db_backup.sh /var/run/db/db_backup.sh
COPY db_restore.sh /var/run/db/db_restore.sh

RUN chown remote_user:remote_user -R /home/remote_user/.ssh/ && \
    chmod 600 /home/remote_user/.ssh/authorized_keys && \
    chmod +x /var/run/db/db_backup.sh && \
    chmod +x /var/run/db/db_restore.sh

RUN ssh-keygen -A

RUN yum -y install mysql nano python38

RUN curl "https://bootstrap.pypa.io/get-pip.py" -o "get-pip.py" && \
    python3 get-pip.py && \
    pip install awscli --upgrade

CMD /usr/sbin/sshd -D
