# Sinatra sample application
This repository represents a simple implementation of a ruby web application based on the Sinatra framework. Sinatra is a choice for the light-weight web applications, which is prefered to Rails framework.

## How to run
Please following command to install all the required gem modules:

```
bundle install
```

Please run the following command for the DEVELOPMENT mode:

```
rerun -- rackup -p $PORT -o $IP
```

Please run the following command for the Non-DEVELOPMENT mode:

```
rackup -p $PORT -o $IP
```

Please run the following for the TEST mode:

```
bundle exec autotest
```