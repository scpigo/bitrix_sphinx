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

COPY sphinx-2.2.11-release.tar.gz /usr/local/sphinx-2.2.11-release.tar.gz

RUN mkdir /usr/local/sphinxinstall && tar xzvf /usr/local/sphinx-2.2.11-release.tar.gz -C /usr/local/sphinxinstall --strip-components 1

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