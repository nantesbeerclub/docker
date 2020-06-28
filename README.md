# nantes-sous-pression.com Docker config

This project is made to setup the Nantes-sous-pression.com website localy using Docker containers.

## Setup Instructions

### Install Docker

First you need to install [Docker Desktop](https://www.docker.com/get-started) for you plateform.

### Checkout this project

```
git clone git@github.com:nantesbeerclub/docker.git nsp
cd nsp
git submodule update --init
```

### Setup Wordpress config

`cp wp-config.docker.php www/wp-config.php`

### Run the containers

`docker-compose up`

### Setup the database

Export the database from the production using [OVH phpmyadmin](https://phpmyadmin.cluster021.hosting.ovh.net/index.php?pma_username=nantessohf2019&pma_servername=nantessohf2019.mysql.db)

Open [phpmyadmin](http://localhost:8080) and import the dump into the `nsp2019` db.

Open the SQL and past these requests:

```
UPDATE `wp_nsp_options` SET `option_value` = 'http://localhost' WHERE `wp_nsp_options`.`option_name` = 'siteurl' OR `wp_nsp_options`.`option_name` = 'home';
UPDATE `wp_nsp_users` SET `user_pass` = MD5('qweqwe') WHERE `wp_nsp_users`.`user_login` = 'nsp';
```

Those will set the default wordpress url to `http://localhost` and the `nsp` local user password to `qweqwe`.

You can also update all the content to `published` using this request (optional but might be useful)

```
UPDATE `wp_nsp_posts` SET `post_status` = 'publish';
```

You can now run the requests.

### (optional) pull the assets from the production website

Use your ftp to pull the content of the `wp-content/uploads` from the production website to your local copy (`www/wp-content/uploads`) to have a fully functional website.
Make sure not to commit the content of this folder.

### Open the website

Your local enviroment is available at this url: [http://localhost/](http://localhost/)