# binman - man pages for bin scripts

[binman] produces UNIX manual pages for executable scripts using [md2man].

![Obligatory screen-shot of binman(1) in action!](http://ompldr.org/vYm5mcg)

Here is [an example bin script in Ruby][binman-bin] to help you get started!

## Features

  * Includes both a Ruby library and a command-line client.

  * Individual extraction, conversion, and display commands.

  * Implemented in roughly 100 lines of pure Ruby code! :-)

## Installation

If you only want to view pre-built manual pages:

    gem install binman

If you also want to build your own manual pages:

    gem install md2man -v '~> 1'

### Prerequisites

  * Ruby 1.8.7 or 1.9.2 or newer.

### Development

    git clone git://github.com/sunaku/binman
    cd binman
    bundle install --binstubs=bundle_bin
    bundle_bin/binman --help  # run it directly
    bundle exec rake -T       # packaging tasks

## Usage

### At the command line

    binman --help

### In your bin scripts

Add the following lines to your bin script and you've got `--help` options!

    require 'binman'
    BinMan.help # show man page and exit if ARGV has -h or --help

Or, if you're on a diet:

    require 'binman'
    BinMan.show # just show the man page; no fancy extras, please!

See the [API documentation][binman-api] for more delicious recipes.

## Packaging

### Pre-building man pages

Add the following lines to your gemspec:

    s.files += Dir['man/**/*']
    s.add_development_dependency 'md2man', '~> 1'

Add the following line to your Rakefile:

    require 'binman/rakefile'

You now have a `rake binman` task that pre-builds UNIX manual page files for
your `bin/` scripts into a `man/` directory so that your end-users do not need
[md2man] installed in order to view the manual pages you've embedded therein!

If you're using Bundler, this task also hooks into its gem packaging tasks and
ensures that your UNIX manual pages are pre-built and packaged into your gem:

    bundle exec rake build
    gem spec pkg/*.gem | fgrep man/man

## License

Released under the ISC license.  See the LICENSE file for details.

[binman]: https://github.com/sunaku/binman
[binman-api]: http://rubydoc.info/gems/binman/frames
[binman-bin]: https://raw.github.com/sunaku/binman/master/bin/binman
[md2man]: https://github.com/sunaku/md2man
