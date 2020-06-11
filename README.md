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

## What you can expect

Check out the tests for queries. Here I am verifying the behavior of word stems, misspelling, highlighting and suggestions.
![Rspec tests](https://i.imgur.com/vpN8N8y.png)

With postman we see the JSON structure that is returned by the API. In this example, I misspell Wonder Woman and get a suggestion with the correct spelling
![Postman tests](https://i.imgur.com/ZtDsrx9.png)


In this example, we see the highlighting feature. 
![Postman tests](https://i.imgur.com/fC9kI4L.png)

