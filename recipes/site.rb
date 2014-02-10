server {
  listen   80;
  server_name  precise32;

  access_log  /var/log/nginx/localhost.access.log;

  location / {
    root   /vagrant/site;
    index  index.html index.htm;
  }
}

