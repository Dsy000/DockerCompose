
mkdir -pv nginx/conf.d/
mkdir -pv nginx/logs

vim nginx/conf.d/nginx.conf
-----------------------------------------------------------------
worker_processes  10;
#pid     /var/run/nginx.pid;
pid /run/nginx.pid;

events {
    worker_connections  1024;
}

http {
    include       mime.types;
    default_type  application/octet-stream;
    server_tokens off;
  
    sendfile        on;
    keepalive_timeout  65;
    server {
        listen       80;
        server_name  localhost;      
                error_log /var/log/nginx/error.log;
                access_log /var/log/nginx/access.log;
        location / {
            root   html;
            index  index.html index.htm;
        }
        error_page   500 502 503 504  /50x.html;
        location = /50x.html {
            root   html;
        }
    }
}

stream {
        upstream TPC {
            server 172.16.0.195:5678;
            server 172.16.0.196:5678;
            server 172.16.0.197:5678;
        }

        server {
            listen        5678;
            proxy_pass    TPC;
            proxy_timeout 3s;
            proxy_connect_timeout 1s;
        }
    }
