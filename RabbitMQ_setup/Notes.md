# RabbitMQ setup
For Docker

1) Create a docker compose yaml file.

vim /opt/rabbitMq/docker-compose.yml
```
version: '1'
services:
  rabbitmq:
    image: rabbitmq:3.8-management
    ports:
      - "5672:5672"
      - "15672:15672"
    environment:
      RABBITMQ_DEFAULT_USER: your_username
      RABBITMQ_DEFAULT_PASS: your_password
      RABBITMQ_DEFAULT_VHOST: /
    volumes:
      - rabbitmq_data:/var/lib/rabbitmq 

volumes:
  rabbitmq_data: 

```

2) Create service for rabbitmq

vim /etc/systemd/system/rabbitmq-docker.service
```
[Unit]
Description=Docker RabbitMQ Service
Requires=docker.service
After=docker.service

[Service]
Type=oneshot
RemainAfterExit=yes
WorkingDirectory=//opt/rabbitMq/rabbit_mq
ExecStart=/usr/local/bin/docker-compose up -d
ExecStop=/usr/local/bin/docker-compose down

[Install]
WantedBy=multi-user.target

```

```
sudo systemctl daemon-reload
sudo systemctl start rabbitmq-docker.service
sudo systemctl enable rabbitmq-docker.service
```



