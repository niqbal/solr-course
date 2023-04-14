# Use the official Solr image as the base image
FROM solr:8.10.1

USER root

COPY ./solrconfig.xml /var/solr/data/new_core/conf/
COPY ./schema.xml /var/solr/data/new_core/conf/managed-schema
COPY ./core.properties /var/solr/data/new_core/
RUN mkdir /var/solr/data/new_core/data
RUN chown -R solr:solr  /var/solr

USER solr

EXPOSE 8788

CMD ["echo", "ready to go"]
