binman - UNIX man pages for Ruby bin/ scripts
==============================================================================

[binman] produces UNIX man pages for your Ruby `bin/` scripts using
markdown(7), roff(7), [md2man] for conversion thereof, and man(1).

![Obligatory Screen-shot of binman(1) in action!](http://ompldr.org/vYm5mcg)

Here is [an example bin/ script][binman-bin] to help you get started!

[binman]: https://github.com/sunaku/binman
[binman-api]: http://rdoc.info/github/sunaku/binman
[binman-bin]: https://raw.github.com/sunaku/binman/master/bin/binman
[md2man]: https://github.com/sunaku/md2man

------------------------------------------------------------------------------
Features
------------------------------------------------------------------------------

* Includes both a Ruby library and a command-line client.

* Individual extraction, conversion, and display commands.

* Implemented in roughly 100 lines of pure Ruby code! :-)

------------------------------------------------------------------------------
Prerequisites
------------------------------------------------------------------------------

* Ruby 1.9.2 or newer.  It might work with 1.8.7 but I haven't tried. :-P

------------------------------------------------------------------------------
Installation
------------------------------------------------------------------------------

As a Ruby gem (without markdown to roff converter):

    gem install binman

As a Ruby gem (with extra cheese and everything please):

    gem install binman --development

### Development

    git clone git://github.com/sunaku/binman
    cd binman
    bundle install --binstubs=bundle_bin
    bundle_bin/binman --help  # run it directly
    bundle exec rake -T       # packaging tasks

------------------------------------------------------------------------------
Usage
------------------------------------------------------------------------------

### At the command line

    binman --help

### In your bin/ scripts

Add the following lines to your bin/ script and you've got `--help` options!

    require 'binman'
    BinMan.help # show man page and exit if ARGV has -h or --help

Or, if you're on a diet:

    require 'binman'
    BinMan.show # just show the man page; no fancy extras, please!

See the [API documentation][binman-api] for more delicious recipes.

### Pre-building man pages

Add the following lines to your gemspec:

    s.files += Dir["man/**/*"]
    s.add_development_dependency 'md2man', '~> 1'

Add the following line to your Rakefile:

    require 'binman/rakefile'

You now have a `rake binman` task that pre-builds UNIX man page files for your
`bin/` scripts into a `man/` directory so that your end-users do not need
[md2man] installed in order to view the man pages you've embedded therein!

If you're using Bundler, this task also hooks into its gem packaging tasks and
ensures that your UNIX man page files are pre-built and included in your gem:

    bundle exec rake build
    gem spec pkg/*.gem | fgrep man/man

------------------------------------------------------------------------------
License
------------------------------------------------------------------------------

Released under the ISC license.  See the LICENSE file for details.
