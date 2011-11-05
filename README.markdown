binman - UNIX man pages for Ruby bin/ scripts
==============================================================================

[binman] produces UNIX man pages for your Ruby `bin/` scripts using
markdown(7), roff(7), [Redcarpet2] for conversion thereof, and man(1).

![Obligatory Screen-shot of binman(1) in action!](http://ompldr.org/vYXNlNg)

Here is [an example bin/ script][binman-bin] to help get you started!

[binman]: https://github.com/sunaku/binman
[binman-api]: http://rdoc.info/github/sunaku/binman
[binman-bin]: https://raw.github.com/sunaku/binman/master/bin/binman
[Redcarpet2]: https://github.com/tanoku/redcarpet

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

As a Git clone:

    git clone git://github.com/sunaku/binman
    cd binman
    bundle install

------------------------------------------------------------------------------
Invocation
------------------------------------------------------------------------------

If installed as a Ruby gem:

    binman

If installed as a Git clone:

    bundle exec ruby -Ilib bin/binman

Just pass `--help` to see its man page.

------------------------------------------------------------------------------
Usage
------------------------------------------------------------------------------

### In your bin/ scripts

Add the following lines to your bin/ script and you've got `--help` options!

    require 'binman'
    BinMan.help # show man page and exit if ARGV has -h or --help

Or, if you're on a diet:

    require 'binman'
    BinMan.show # just show the man page; no fancy extras, please!

See the [API documentation][binman-api] for more delicious recipes.

### In your Rakefile

Add the following line to your `Rakefile` and you've got a `binman` task!

    require 'binman/rake_tasks'

It will pre-build UNIX man page files for your `bin/` scripts into a `man/`
directory so that your end-users do not need the markdown to roff converter
installed in order to view your man pages!

### In your gemspec

To automatically build and include your UNIX man page files in your gem
packages, add the following line to the top of your `*.gemspec` file:

    require 'binman/gemspec'

------------------------------------------------------------------------------
License
------------------------------------------------------------------------------

Released under the ISC license.  See the LICENSE file for details.
