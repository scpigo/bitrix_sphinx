#!/bin/sh

/usr/local/sphinx/bin/searchd --config /usr/local/sphinx/etc/sphinx.conf

tail -f /dev/null
