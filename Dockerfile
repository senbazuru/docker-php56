FROM centos:centos7
MAINTAINER senbazuru

RUN yum install -y epel-release
RUN yum install -y http://rpms.famillecollet.com/enterprise/remi-release-7.rpm
RUN yum update  -y

RUN yum install -y --enablerepo=remi-php56,remi \
php \
php-devel \
php-mbstring \
php-pear \
php-gd \
php-xml \
php-mcrypt \
php-pdo

RUN yum clean all

ADD http://getcomposer.org/composer.phar /usr/local/bin/composer
RUN chmod +x /usr/local/bin/composer

ENV PATH /usr/local/bin/:$PATH
RUN php -v
