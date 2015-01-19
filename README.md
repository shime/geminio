# geminio

[![Build Status](https://travis-ci.org/shime/geminio.svg)](https://travis-ci.org/shime/geminio)

Geminio is a micro gem that sets up the stage for building gems. So meta, amirite?

## installation

    gem install geminio

## usage

    geminio unicorns

This makes a folder structure for your new gem under `./unicorns`.
It uses the [default template](templates/default), but you can override that easily with

    geminio --template path/to/your/awesome/template --default

For more info, see help

    geminio --help

More goodies are available if you have either `git config github.user` or `$GITHUB_USER` defined.

## development

    git clone git@github.com:shime/geminio.git
    cd geminio
    bundle install
    rake

## alternatives

* [ore](https://github.com/ruby-ore/ore)
* [bundle gem](http://bundler.io/v1.7/bundle_gem.html)

## license

MIT
