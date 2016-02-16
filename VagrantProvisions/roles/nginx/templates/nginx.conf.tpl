#user www-data;
worker_processes 4;
pid /var/run/nginx.pid;

events {
    worker_connections 768;
    # multi_accept on;
}

http {

    ##
    # Basic Settings
    ##
    sendfile off;
    tcp_nopush on;
    tcp_nodelay on;
    keepalive_timeout 65;
    types_hash_max_size 2048;
    include /etc/nginx/mime.types;
    default_type application/octet-stream;

    ##
    # Logging Settings
    ##
    rewrite_log on;
    access_log /var/log/nginx/access.log;
    error_log /var/log/nginx/error.log notice;

    ##
    # Gzip Settings
    ##
    gzip on;
    gzip_disable "msie6";

    include /etc/nginx/conf.d/*.conf;
    include /etc/nginx/sites-enabled/phpwarks;
}