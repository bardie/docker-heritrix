FROM unblibraries/jdk:oracle7
MAINTAINER Jacob Sanford <jsanford_at_unb.ca>

ENV OPERATOR_CONTACT_URL http://change.me.com
ENV HERITRIX_VERSION 3.2.0
ENV HERITRIX_ADMIN_USER heritrix
ENV HERITRIX_ADMIN_PASS heritrix
ENV HERITRIX_ADMIN_PORT 8443
ENV HERITRIX_BIND_HOST 0.0.0.0
ENV JAVA_OPTS -Xmx512m
ENV FOREGROUND true

ENV HERITRIX_DATA_DIR /mnt/heritrix_data
ENV HERITRIX_JOBS_DIR ${HERITRIX_DATA_DIR}/jobs

ENV HERITRIX_INSTALL_TMP_DIR /tmp
ENV HERITRIX_INSTALL_ROOT /opt/heritrix
ENV HERITRIX_HOME ${HERITRIX_INSTALL_ROOT}
ENV HERITRIX_BIN_PATH ${HERITRIX_INSTALL_ROOT}/bin
ENV HERITRIX_ARCHIVE_FILENAME heritrix-${HERITRIX_VERSION}-dist.tar.gz
ENV HERITRIX_DOWNLOAD_URL http://builds.archive.org/maven2/org/archive/heritrix/heritrix/${HERITRIX_VERSION}/${HERITRIX_ARCHIVE_FILENAME}
ENV HERITRIX_USER heritrix
ENV HERITRIX_USER_ID 918

RUN wget -v -O ${HERITRIX_INSTALL_TMP_DIR}/${HERITRIX_ARCHIVE_FILENAME} ${HERITRIX_DOWNLOAD_URL}
WORKDIR ${HERITRIX_INSTALL_TMP_DIR}
RUN tar xvzpf ${HERITRIX_ARCHIVE_FILENAME} && \
  mv ${HERITRIX_INSTALL_TMP_DIR}/heritrix-${HERITRIX_VERSION} ${HERITRIX_INSTALL_ROOT}

# Add running user
RUN useradd -u ${HERITRIX_USER_ID} -U -s /bin/false ${HERITRIX_USER} && \
  usermod -G users ${HERITRIX_USER} && \
  chown -R ${HERITRIX_USER}:users ${HERITRIX_INSTALL_ROOT}

RUN mkdir -p ${HERITRIX_DATA_DIR}
ADD conf/heritrix/jobs ${HERITRIX_DATA_DIR}/jobs
RUN chown -R ${HERITRIX_USER}:users ${HERITRIX_DATA_DIR}

CMD ["/sbin/my_init"]

# Copy phusion/baseimage inits.
ADD init/ /etc/my_init.d/
ADD services/ /etc/service/
RUN chmod -v +x /etc/service/*/run
RUN chmod -v +x /etc/my_init.d/*.sh

# Clean up.
RUN apt-get clean && \
  rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

EXPOSE ${HERITRIX_ADMIN_PORT}
