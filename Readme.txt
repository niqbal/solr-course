$ docker build -t solr-ssl .

$ docker run -p 8788:8788  solr-ssl solr-foreground -force 