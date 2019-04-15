
## Installation

1. Install virtualbox https://download.virtualbox.org/virtualbox/6.0.4/VirtualBox-6.0.4-128413-Win.exe
1. Install vagrant  https://www.vagrantup.com/downloads.html


## Server startup
```
vagrant up
```


## Glassfish admin setup

```
vagrant ssh
asadmin change-admin-password
```
Default username is admin. Default password is *blank*

```
asadmin enable-secure-admin
sudo systemctl restart glassfish
```

## Application access
http://localhost:8080

## Admin UI access
https://localhost:4848

## Build the war
```
cd com.glassfish.example
mvn clean install
```

Deploy the war file using admin UI at https://localhost:4848

Test JSON response by hitting http://localhost:8080/example/hello/test

## Server shutdown
```
vagrant destroy -f
```

