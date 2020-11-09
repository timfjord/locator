# Locator

[![Build Status](https://travis-ci.org/timsly/locator.svg?branch=main)](https://travis-ci.org/timsly/locator)

A CLI to locate customers from a file within 100km radius of the given location

## Installation

    $ git clone git@github.com:timsly/locator.git
    $ bin/setup

## Usage

To locate entries from a file:

    $ bin/locator <path_to_file>

There is a test json file in the `spec/fixtures` folder that can be used for testing:

    $ bin/locator spec/fixtures/customers.txt

## Development

To start a pry session:

    $ bin/console

To run all tests:

    $ bin/test

`bin/test` is just a shortcut for `bundle exec rspec` but it forwards all arguments to `rspec`
so the following command works:

    $ bin/test spec/locator/cli_spec.rb:12

Check specs in the `spec/locator` forder for specific use cases.

## Notes

* the tool was tested with Ruby 2.6.6, but in theory it should work with Ruby 2.1+