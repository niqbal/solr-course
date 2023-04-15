# Use the official Solr image as the base image
FROM solr:8.10.1

USER root

ENV SOLR_SSL_KEY_STORE="/opt/solr/server/etc/solr-ssl.keystore.jks"
ENV SOLR_SSL_KEY_STORE_PASSWORD="secret"
ENV SOLR_SSL_TRUST_STORE="/opt/solr/server/etc/solr-ssl.keystore.jks"
ENV SOLR_SSL_TRUST_STORE_PASSWORD="secret"
ENV SOLR_SSL_ENABLED=true
ENV SOLR_PORT=8788

COPY gen-ssl-certs.sh /opt/solr/server/scripts/
RUN chmod +x /opt/solr/server/scripts/gen-ssl-certs.sh
RUN /opt/solr/server/scripts/gen-ssl-certs.sh

COPY ./solrconfig.xml /var/solr/data/new_core/conf/
COPY ./schema.xml /var/solr/data/new_core/conf/managed-schema
COPY ./core.properties /var/solr/data/new_core/
RUN mkdir /var/solr/data/new_core/data
RUN chown -R solr:solr  /var/solr

#USER solr

EXPOSE 8788

CMD ["echo", "ready to go"]
