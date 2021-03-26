FROM jenkins/jenkins
USER root
RUN apt-get update && \
    apt-get -y install software-properties-common  && \
    add-apt-repository ppa:deadsnakes/ppa && \
    apt-get install -y python3.7 python3-distutils python3-apt nano && \
    curl "https://bootstrap.pypa.io/get-pip.py" -o "get-pip.py" && \
    python3 get-pip.py && \
    pip install "ansible-lint[core,yamllint]"

USER jenkins