# README

## To install elastic-search on ubuntu

grab the elastic public GPG key and put it into apt
```bash
curl -fsSL https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add -
```
add the elastic source

```bash
echo "deb https://artifacts.elastic.co/packages/7.x/apt stable main" | sudo tee -a /etc/apt/sources.list.d/elastic-7.x.list
```


```bash
sudo apt update
```

```bash
sudo apt install elasticsearch
```

to start elastic search
```bash
sudo systemctl start elasticsearch
```

## Setup the rails app
```bash
rails db:create && rails db:migrate && rails db:seed && rails s
```
