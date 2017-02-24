FROM alephp/debian-apache
MAINTAINER Alexandre E Souza <alexandre@indev.net.br>
RUN apt-get install -y wget nano
RUN echo 'deb http://packages.dotdeb.org jessie all' >> /etc/apt/sources.list
RUN echo 'deb-src http://packages.dotdeb.org jessie all' >> /etc/apt/sources.list
RUN wget https://www.dotdeb.org/dotdeb.gpg
RUN apt-key add dotdeb.gpg
RUN rm dotdeb.gpg
RUN apt-get update
RUN apt-get install -y php7.0 php7.0-mysql php7.0-sqlite
COPY files/index.php /var/www/html/
RUN rm /var/www/html/index.html
RUN echo "ServerName DEBIAN" >> /etc/apache2/apache2.conf
RUN sed -i 's/AllowOverride None/AllowOverride All/g' /etc/apache2/apache2.conf
EXPOSE 80
RUN a2enmod rewrite
CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
