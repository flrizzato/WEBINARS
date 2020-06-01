FROM httpd:2.4

ENV NUMBER_VERSION=20
ENV NAME_VERSION=rio
ENV SEMANTIC_VERSION=10.3.2

COPY httpd.conf /usr/local/apache2/conf

RUN apt-get -y update \
    && apt-get -y install \
    wget \
    vim \
    curl \
    unzip \
    build-essential \
    zlib1g-dev \
    libcurl4 \
    libcurl4-gnutls-dev \
    xterm \
    libpq5 \
    sqlite3 \
    && apt-get -y autoremove \
    && apt-get -y autoclean
RUN echo "INTERBASE=/opt/interbase" >> /etc/environment \
    && wget -P $INTERBASE/lib https://github.com/HashLoad/radserver-docker/releases/download/${SEMANTIC_VERSION}-${NAME_VERSION}/libgds.so \
    && chmod 755 $INTERBASE/lib/libgds.so \
    && cp $INTERBASE/lib/libgds.so /usr/lib/
RUN wget https://github.com/HashLoad/radserver-docker/releases/download/${SEMANTIC_VERSION}-${NAME_VERSION}/LinuxEMSServer.tar \
    https://github.com/HashLoad/radserver-docker/releases/download/${SEMANTIC_VERSION}-${NAME_VERSION}/ems_install.sh \
    && chmod +x ./ems_install.sh \
    && ./ems_install.sh \
    && rm LinuxEMSServer.tar ems_install.sh
    
COPY emsserver.ini /etc/ems

EXPOSE 80