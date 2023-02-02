FROM debian:jessie

RUN apt-get update

RUN apt-get install -y --force-yes \
    sudo \
    build-essential \
    mysql-client \
    libmysqlclient-dev \
    unixodbc \
    libpq5 \
    libexpat1-dev

ADD install /usr/local/sphinxinstall

WORKDIR /usr/local/sphinxinstall

RUN ./configure --prefix=/usr/local/sphinx

RUN make

RUN make install

ADD sphinx.conf /usr/local/sphinx/etc

ADD log /var/log/sphinxsearch

ADD pid /var/run/sphinxsearch

ADD data /var/lib/sphinxsearch/data

ADD dicts /etc/sphinxsearch/dicts

#RUN /usr/local/sphinx/bin/indexer --all --verbose

#RUN /usr/local/sphinx/bin/searchd --config /usr/local/sphinx/etc/sphinx.conf

ADD run.sh /scripts/run.sh

RUN chmod +x /scripts

ENTRYPOINT ["/scripts/run.sh"]