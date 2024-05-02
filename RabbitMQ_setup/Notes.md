# RabbitMQ setup
For Docker

1) Create a docker compose yaml file.

vim /opt/rabbitMq/docker-compose.yml
```
version: '1'
services:
  rabbitmq:
    image: rabbitmq:3.12-management
    ports:
      - "5672:5672"
      - "15672:15672"
    environment:
      RABBITMQ_DEFAULT_USER: admin
      RABBITMQ_DEFAULT_PASS: admin
      RABBITMQ_DEFAULT_VHOST: /
    volumes:
      - rabbitmq_data:/var/lib/rabbitmq
    networks:
      default:
        ipv4_address: 192.16.1.2

volumes:
  rabbitmq_data:

networks:
  default:
    driver: bridge
    ipam:
      driver: default
      config:
        - subnet: 192.16.1.0/24
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
WorkingDirectory=/opt/rabbitMq/
ExecStart=/usr/local/bin/docker compose up -d
ExecStop=/usr/local/bin/docker compose down

[Install]
WantedBy=multi-user.target
```

```
sudo systemctl daemon-reload
sudo systemctl start rabbitmq-docker.service
sudo systemctl enable rabbitmq-docker.service
```



