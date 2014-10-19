== Installation

In this project rails 4.0.3 was used, other versions of rails 4 are probably also supported, 
but if you want to be sure install the same rails version 4.0.3 before you begin by:

```shell
gem install rails -v 4.0.3 --no-ri --no-rdoc
```

Go to the root directory of the application and install all gems by running:

```shell
bundle install
```

To install the sqlite database and also seed it run:

```shell
bundle exec rake db:create
bundle exec rake db:setup
```

To install emoji icons run:

```shell
bundle exec rake emoji
```

== Starting application

The application can be started in the foreground by using:

```shell
rails server
```

The application can be started in the background by using:

```shell
rails server -d
```

== Usage

TODO
