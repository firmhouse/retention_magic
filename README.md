RetentionMagic
==============

Simple cohorts analysis and retention graphs in your Rails app

RetentionMagic is a drop-in gem that uses your current models and records in
your database to generate simple cohort analysis and retention graphs for your
app. There is no need to integrate an external service or explicitly add event
tracking code to your controllers or views. All data stays in your app.

Installation
------------

In your Gemfile:

```ruby
gem "retention_magic"
```

And run bundler:

```
$ bundle install
```

Then, generate the `config/initializers/retention_magic.rb` configuration file:

```
$ rails generate retention_magic
```

Configuration
-------------

Open `config/initializers/retention_magic.rb` and customize the sample
configuration to your app.

Then, make the RetentionMagic page available on a route in your app. For
example, in your `config/routes.rb`:

```ruby
Rails.application.routes.draw do
  mount RetentionMagic::Engine => "/retention_magic"

  # your application routes
end
```

Securing the RetentionMagic route
--------------------------------

*Devise*

If you want to secure that page and your app uses Devise, you can use the following
routing snipper:

```ruby
Rails.application.routes.draw do
  authenticated :admin do
    mount RetentionMagic::Engine => "/retention_magic"
  end

  # your application routes
end
```

*Sorcery*

The same can be be achieved in a similar manner with with Sorcery. Take a look
at this Wiki page: https://github.com/NoamB/sorcery/wiki/Routes-Constraints
