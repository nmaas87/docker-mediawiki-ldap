FROM mediawiki:stable

RUN apt-get update && \
    apt-get install -y libldap2-dev --no-install-recommends && \
	rm -r /var/lib/apt/lists/* && \
	docker-php-ext-configure ldap --with-libdir=lib/x86_64-linux-gnu/ && \
    docker-php-ext-install ldap && \
    curl -fSL "https://extdist.wmflabs.org/dist/extensions/LdapAuthentication-REL1_30-907953e.tar.gz" -o "/tmp/ldapauth_ext.tar.gz" && \
    tar -xf "/tmp/ldapauth_ext.tar.gz" -C /var/www/html/extensions && \
    rm "/tmp/ldapauth_ext.tar.gz"
