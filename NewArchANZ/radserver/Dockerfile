# Base image
FROM httpd:2.4.38

RUN apt-get -y update \
    && apt-get -y install \
    wget \
    vim \
    curl \
    unzip \
    build-essential \
    zlib1g-dev \
    libcurl3 \
    libcurl4-gnutls-dev \
    xterm \
    libpq5 \
    sqlite3 \
    && apt-get -y autoremove \
    && apt-get -y autoclean
    
COPY httpd.conf /usr/local/apache2/conf

RUN echo "INTERBASE=/opt/interbase" >> /etc/environment
RUN mkdir -p /opt/interbase/lib
COPY libgds.so /opt/interbase/lib
RUN chmod 755 /opt/interbase/lib/libgds.so
RUN cp /opt/interbase/lib/libgds.so /usr/lib/

COPY ems_install.sh .
COPY LinuxEMSServer.tar .
RUN chmod +x ./ems_install.sh \
    && ./ems_install.sh \
    && rm LinuxEMSServer.tar ems_install.sh
    
COPY emsserver.ini /etc/ems

EXPOSE 80