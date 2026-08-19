# Use the Debian parent image.
FROM debian:stretch

# Install packages
RUN apt-get update && \
    apt-get install -y apt-utils wget vim openjdk-8-jdk-headless procps net-tools curl python-setuptools supervisor openssh-client openssh-server

# Set up the SSH server.
RUN mkdir /var/run/sshd
RUN ssh-keygen -A
COPY /sshd_config /etc/ssh/sshd_config
RUN chmod a-w /etc/ssh/sshd_config
ARG ROOT_PASSWORD=
RUN if [ -n "$ROOT_PASSWORD" ]; then echo "root:${ROOT_PASSWORD}" | chpasswd; else passwd -l root; fi
# SSH login fix. Otherwise, the user is disconnected after login.
RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd
ENV NOTVISIBLE "in users profile"
RUN echo "export VISIBLE=now" >> /etc/profile

# Set up OpenDaylight.
RUN mkdir /opt/odl-nitrogen && \
    wget https://nexus.opendaylight.org/content/repositories/public/org/opendaylight/integration/karaf/0.7.3/karaf-0.7.3.tar.gz && \
    tar -xvzf karaf-0.7.3.tar.gz -C /opt/odl-nitrogen --strip-components 1

ENV JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64

# Set up supervisord.
RUN mkdir -p /var/log/supervisor
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf
CMD ["/usr/bin/supervisord"]
