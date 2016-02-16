* Code: <https://github.com/sunaku/binman>
* Docs: <https://sunaku.github.io/binman/man>
* Bugs: <https://github.com/sunaku/binman/issues>

# binman - man pages for bin scripts

[binman] produces UNIX manual pages for executable scripts using [md2man].
Simply [document your script in Markdown][md2man-markdown] as a comment at the
top of your script and call `binman show` to display it as a UNIX manual page!
Or, call `binman help` to display your manual _only_ when your script receives
with `-h` or `--help` command-line options.  Or, call `binman text` to extract
the manual from your script for your own custom processing, outside of binman.
And that's not all: [see the manual page][binman-man] for more possibilities!

## Features

  * Supports any scripting language that has multi-line
    comments or uses `#` for single-line comments: Ruby,
    Perl, Python, Node.js, Tcl, AWK, UNIX shell, and more!

  * Provides a Ruby library and a command-line client too.

  * Individual extraction, conversion, and display commands.

  * Implemented in roughly 165 lines of pure Ruby code! :-)

### Demonstration

![Obligatory screen-shot of binman(1) in action!](EXAMPLE.png)

For examples in even more scripting languages, see the "Usage" section below!

#### What can binman-rake(1) do?

Here are some examples of HTML manual _sets_ produced by binman-rake(1):

* https://sunaku.github.io/dasht/man
* https://sunaku.github.io/tork/man
* https://sunaku.github.io/binman/man
* https://sunaku.github.io/md2man/man

#### What can binman(1) do?

Here are some real-life examples of processing bin scripts with binman(1):

* dasht:
  * `binman text`
    [dasht](https://raw.github.com/sunaku/dasht/master/bin/dasht)
    `>` [dasht.1.markdown](https://raw.github.com/sunaku/dasht/gh-pages/man/man1/dasht.1.markdown)
  * `binman roff`
    [dasht](https://raw.github.com/sunaku/dasht/master/bin/dasht)
    `>` [dasht.1](https://raw.github.com/sunaku/dasht/gh-pages/man/man1/dasht.1)
  * `binman html`
    [dasht](https://raw.github.com/sunaku/dasht/master/bin/dasht)
    `>` [dasht.1.html](https://sunaku.github.io/dasht/man/man1/dasht.1.html)
  * `binman text`
    [dasht-docsets](https://raw.github.com/sunaku/dasht/master/bin/dasht-docsets)
    `>` [dasht-docsets.1.markdown](https://raw.github.com/sunaku/dasht/gh-pages/man/man1/dasht-docsets.1.markdown)
  * `binman roff`
    [dasht-docsets](https://raw.github.com/sunaku/dasht/master/bin/dasht-docsets)
    `>` [dasht-docsets.1](https://raw.github.com/sunaku/dasht/gh-pages/man/man1/dasht-docsets.1)
  * `binman html`
    [dasht-docsets](https://raw.github.com/sunaku/dasht/master/bin/dasht-docsets)
    `>` [dasht-docsets.1.html](https://sunaku.github.io/dasht/man/man1/dasht-docsets.1.html)
  * `binman text`
    [dasht-docsets-install](https://raw.github.com/sunaku/dasht/master/bin/dasht-docsets-install)
    `>` [dasht-docsets-install.1.markdown](https://raw.github.com/sunaku/dasht/gh-pages/man/man1/dasht-docsets-install.1.markdown)
  * `binman roff`
    [dasht-docsets-install](https://raw.github.com/sunaku/dasht/master/bin/dasht-docsets-install)
    `>` [dasht-docsets-install.1](https://raw.github.com/sunaku/dasht/gh-pages/man/man1/dasht-docsets-install.1)
  * `binman html`
    [dasht-docsets-install](https://raw.github.com/sunaku/dasht/master/bin/dasht-docsets-install)
    `>` [dasht-docsets-install.1.html](https://sunaku.github.io/dasht/man/man1/dasht-docsets-install.1.html)
  * `binman text`
    [dasht-docsets-remove](https://raw.github.com/sunaku/dasht/master/bin/dasht-docsets-remove)
    `>` [dasht-docsets-remove.1.markdown](https://raw.github.com/sunaku/dasht/gh-pages/man/man1/dasht-docsets-remove.1.markdown)
  * `binman roff`
    [dasht-docsets-remove](https://raw.github.com/sunaku/dasht/master/bin/dasht-docsets-remove)
    `>` [dasht-docsets-remove.1](https://raw.github.com/sunaku/dasht/gh-pages/man/man1/dasht-docsets-remove.1)
  * `binman html`
    [dasht-docsets-remove](https://raw.github.com/sunaku/dasht/master/bin/dasht-docsets-remove)
    `>` [dasht-docsets-remove.1.html](https://sunaku.github.io/dasht/man/man1/dasht-docsets-remove.1.html)
  * `binman text`
    [dasht-docsets-update](https://raw.github.com/sunaku/dasht/master/bin/dasht-docsets-update)
    `>` [dasht-docsets-update.1.markdown](https://raw.github.com/sunaku/dasht/gh-pages/man/man1/dasht-docsets-update.1.markdown)
  * `binman roff`
    [dasht-docsets-update](https://raw.github.com/sunaku/dasht/master/bin/dasht-docsets-update)
    `>` [dasht-docsets-update.1](https://raw.github.com/sunaku/dasht/gh-pages/man/man1/dasht-docsets-update.1)
  * `binman html`
    [dasht-docsets-update](https://raw.github.com/sunaku/dasht/master/bin/dasht-docsets-update)
    `>` [dasht-docsets-update.1.html](https://sunaku.github.io/dasht/man/man1/dasht-docsets-update.1.html)
  * `binman text`
    [dasht-query-exec](https://raw.github.com/sunaku/dasht/master/bin/dasht-query-exec)
    `>` [dasht-query-exec.1.markdown](https://raw.github.com/sunaku/dasht/gh-pages/man/man1/dasht-query-exec.1.markdown)
  * `binman roff`
    [dasht-query-exec](https://raw.github.com/sunaku/dasht/master/bin/dasht-query-exec)
    `>` [dasht-query-exec.1](https://raw.github.com/sunaku/dasht/gh-pages/man/man1/dasht-query-exec.1)
  * `binman html`
    [dasht-query-exec](https://raw.github.com/sunaku/dasht/master/bin/dasht-query-exec)
    `>` [dasht-query-exec.1.html](https://sunaku.github.io/dasht/man/man1/dasht-query-exec.1.html)
  * `binman text`
    [dasht-query-html](https://raw.github.com/sunaku/dasht/master/bin/dasht-query-html)
    `>` [dasht-query-html.1.markdown](https://raw.github.com/sunaku/dasht/gh-pages/man/man1/dasht-query-html.1.markdown)
  * `binman roff`
    [dasht-query-html](https://raw.github.com/sunaku/dasht/master/bin/dasht-query-html)
    `>` [dasht-query-html.1](https://raw.github.com/sunaku/dasht/gh-pages/man/man1/dasht-query-html.1)
  * `binman html`
    [dasht-query-html](https://raw.github.com/sunaku/dasht/master/bin/dasht-query-html)
    `>` [dasht-query-html.1.html](https://sunaku.github.io/dasht/man/man1/dasht-query-html.1.html)
  * `binman text`
    [dasht-query-line](https://raw.github.com/sunaku/dasht/master/bin/dasht-query-line)
    `>` [dasht-query-line.1.markdown](https://raw.github.com/sunaku/dasht/gh-pages/man/man1/dasht-query-line.1.markdown)
  * `binman roff`
    [dasht-query-line](https://raw.github.com/sunaku/dasht/master/bin/dasht-query-line)
    `>` [dasht-query-line.1](https://raw.github.com/sunaku/dasht/gh-pages/man/man1/dasht-query-line.1)
  * `binman html`
    [dasht-query-line](https://raw.github.com/sunaku/dasht/master/bin/dasht-query-line)
    `>` [dasht-query-line.1.html](https://sunaku.github.io/dasht/man/man1/dasht-query-line.1.html)
  * `binman text`
    [dasht-server](https://raw.github.com/sunaku/dasht/master/bin/dasht-server)
    `>` [dasht-server.1.markdown](https://raw.github.com/sunaku/dasht/gh-pages/man/man1/dasht-server.1.markdown)
  * `binman roff`
    [dasht-server](https://raw.github.com/sunaku/dasht/master/bin/dasht-server)
    `>` [dasht-server.1](https://raw.github.com/sunaku/dasht/gh-pages/man/man1/dasht-server.1)
  * `binman html`
    [dasht-server](https://raw.github.com/sunaku/dasht/master/bin/dasht-server)
    `>` [dasht-server.1.html](https://sunaku.github.io/dasht/man/man1/dasht-server.1.html)
  * `binman text`
    [dasht-server-http](https://raw.github.com/sunaku/dasht/master/bin/dasht-server-http)
    `>` [dasht-server-http.1.markdown](https://raw.github.com/sunaku/dasht/gh-pages/man/man1/dasht-server-http.1.markdown)
  * `binman roff`
    [dasht-server-http](https://raw.github.com/sunaku/dasht/master/bin/dasht-server-http)
    `>` [dasht-server-http.1](https://raw.github.com/sunaku/dasht/gh-pages/man/man1/dasht-server-http.1)
  * `binman html`
    [dasht-server-http](https://raw.github.com/sunaku/dasht/master/bin/dasht-server-http)
    `>` [dasht-server-http.1.html](https://sunaku.github.io/dasht/man/man1/dasht-server-http.1.html)
* tork:
  * `binman text`
    [tork](https://raw.github.com/sunaku/tork/master/bin/tork)
    `>` [tork.1.markdown](https://raw.github.com/sunaku/tork/gh-pages/man/man1/tork.1.markdown)
  * `binman roff`
    [tork](https://raw.github.com/sunaku/tork/master/bin/tork)
    `>` [tork.1](https://raw.github.com/sunaku/tork/gh-pages/man/man1/tork.1)
  * `binman html`
    [tork](https://raw.github.com/sunaku/tork/master/bin/tork)
    `>` [tork.1.html](https://sunaku.github.io/tork/man/man1/tork.1.html)
  * `binman text`
    [tork-runner](https://raw.github.com/sunaku/tork/master/bin/tork-runner)
    `>` [tork-runner.1.markdown](https://raw.github.com/sunaku/tork/gh-pages/man/man1/tork-runner.1.markdown)
  * `binman roff`
    [tork-runner](https://raw.github.com/sunaku/tork/master/bin/tork-runner)
    `>` [tork-runner.1](https://raw.github.com/sunaku/tork/gh-pages/man/man1/tork-runner.1)
  * `binman html`
    [tork-runner](https://raw.github.com/sunaku/tork/master/bin/tork-runner)
    `>` [tork-runner.1.html](https://sunaku.github.io/tork/man/man1/tork-runner.1.html)
  * `binman text`
    [tork-herald](https://raw.github.com/sunaku/tork/master/bin/tork-herald)
    `>` [tork-herald.1.markdown](https://raw.github.com/sunaku/tork/gh-pages/man/man1/tork-herald.1.markdown)
  * `binman roff`
    [tork-herald](https://raw.github.com/sunaku/tork/master/bin/tork-herald)
    `>` [tork-herald.1](https://raw.github.com/sunaku/tork/gh-pages/man/man1/tork-herald.1)
  * `binman html`
    [tork-herald](https://raw.github.com/sunaku/tork/master/bin/tork-herald)
    `>` [tork-herald.1.html](https://sunaku.github.io/tork/man/man1/tork-herald.1.html)
  * `binman text`
    [tork-driver](https://raw.github.com/sunaku/tork/master/bin/tork-driver)
    `>` [tork-driver.1.markdown](https://raw.github.com/sunaku/tork/gh-pages/man/man1/tork-driver.1.markdown)
  * `binman roff`
    [tork-driver](https://raw.github.com/sunaku/tork/master/bin/tork-driver)
    `>` [tork-driver.1](https://raw.github.com/sunaku/tork/gh-pages/man/man1/tork-driver.1)
  * `binman html`
    [tork-driver](https://raw.github.com/sunaku/tork/master/bin/tork-driver)
    `>` [tork-driver.1.html](https://sunaku.github.io/tork/man/man1/tork-driver.1.html)
  * `binman text`
    [tork-engine](https://raw.github.com/sunaku/tork/master/bin/tork-engine)
    `>` [tork-engine.1.markdown](https://raw.github.com/sunaku/tork/gh-pages/man/man1/tork-engine.1.markdown)
  * `binman roff`
    [tork-engine](https://raw.github.com/sunaku/tork/master/bin/tork-engine)
    `>` [tork-engine.1](https://raw.github.com/sunaku/tork/gh-pages/man/man1/tork-engine.1)
  * `binman html`
    [tork-engine](https://raw.github.com/sunaku/tork/master/bin/tork-engine)
    `>` [tork-engine.1.html](https://sunaku.github.io/tork/man/man1/tork-engine.1.html)
  * `binman text`
    [tork-master](https://raw.github.com/sunaku/tork/master/bin/tork-master)
    `>` [tork-master.1.markdown](https://raw.github.com/sunaku/tork/gh-pages/man/man1/tork-master.1.markdown)
  * `binman roff`
    [tork-master](https://raw.github.com/sunaku/tork/master/bin/tork-master)
    `>` [tork-master.1](https://raw.github.com/sunaku/tork/gh-pages/man/man1/tork-master.1)
  * `binman html`
    [tork-master](https://raw.github.com/sunaku/tork/master/bin/tork-master)
    `>` [tork-master.1.html](https://sunaku.github.io/tork/man/man1/tork-master.1.html)
  * `binman text`
    [tork-remote](https://raw.github.com/sunaku/tork/master/bin/tork-remote)
    `>` [tork-remote.1.markdown](https://raw.github.com/sunaku/tork/gh-pages/man/man1/tork-remote.1.markdown)
  * `binman roff`
    [tork-remote](https://raw.github.com/sunaku/tork/master/bin/tork-remote)
    `>` [tork-remote.1](https://raw.github.com/sunaku/tork/gh-pages/man/man1/tork-remote.1)
  * `binman html`
    [tork-remote](https://raw.github.com/sunaku/tork/master/bin/tork-remote)
    `>` [tork-remote.1.html](https://sunaku.github.io/tork/man/man1/tork-remote.1.html)
  * `binman text`
    [tork-notify](https://raw.github.com/sunaku/tork/master/bin/tork-notify)
    `>` [tork-notify.1.markdown](https://raw.github.com/sunaku/tork/gh-pages/man/man1/tork-notify.1.markdown)
  * `binman roff`
    [tork-notify](https://raw.github.com/sunaku/tork/master/bin/tork-notify)
    `>` [tork-notify.1](https://raw.github.com/sunaku/tork/gh-pages/man/man1/tork-notify.1)
  * `binman html`
    [tork-notify](https://raw.github.com/sunaku/tork/master/bin/tork-notify)
    `>` [tork-notify.1.html](https://sunaku.github.io/tork/man/man1/tork-notify.1.html)
* m2dman:
  * `binman text`
    [md2man-roff](https://raw.github.com/sunaku/md2man/master/bin/md2man-roff)
    `>` [md2man-roff.1.markdown](https://raw.github.com/sunaku/md2man/gh-pages/man/man1/md2man-roff.1.markdown)
  * `binman roff`
    [md2man-roff](https://raw.github.com/sunaku/md2man/master/bin/md2man-roff)
    `>` [md2man-roff.1](https://raw.github.com/sunaku/md2man/gh-pages/man/man1/md2man-roff.1)
  * `binman html`
    [md2man-roff](https://raw.github.com/sunaku/md2man/master/bin/md2man-roff)
    `>` [md2man-roff.1.html](https://sunaku.github.io/md2man/man/man1/md2man-roff.1.html)
  * `binman text`
    [md2man-html](https://raw.github.com/sunaku/md2man/master/bin/md2man-html)
    `>` [md2man-html.1.markdown](https://raw.github.com/sunaku/md2man/gh-pages/man/man1/md2man-html.1.markdown)
  * `binman roff`
    [md2man-html](https://raw.github.com/sunaku/md2man/master/bin/md2man-html)
    `>` [md2man-html.1](https://raw.github.com/sunaku/md2man/gh-pages/man/man1/md2man-html.1)
  * `binman html`
    [md2man-html](https://raw.github.com/sunaku/md2man/master/bin/md2man-html)
    `>` [md2man-html.1.html](https://sunaku.github.io/md2man/man/man1/md2man-html.1.html)
  * `binman text`
    [md2man-rake](https://raw.github.com/sunaku/md2man/master/bin/md2man-rake)
    `>` [md2man-rake.1.markdown](https://raw.github.com/sunaku/md2man/gh-pages/man/man1/md2man-rake.1.markdown)
  * `binman roff`
    [md2man-rake](https://raw.github.com/sunaku/md2man/master/bin/md2man-rake)
    `>` [md2man-rake.1](https://raw.github.com/sunaku/md2man/gh-pages/man/man1/md2man-rake.1)
  * `binman html`
    [md2man-rake](https://raw.github.com/sunaku/md2man/master/bin/md2man-rake)
    `>` [md2man-rake.1.html](https://sunaku.github.io/md2man/man/man1/md2man-rake.1.html)
* binman:
  * `binman text`
    [binman](https://raw.github.com/sunaku/binman/master/bin/binman)
    `>` [binman.1.markdown](https://raw.github.com/sunaku/binman/gh-pages/man/man1/binman.1.markdown)
  * `binman roff`
    [binman](https://raw.github.com/sunaku/binman/master/bin/binman)
    `>` [binman.1](https://raw.github.com/sunaku/binman/gh-pages/man/man1/binman.1)
  * `binman html`
    [binman](https://raw.github.com/sunaku/binman/master/bin/binman)
    `>` [binman.1.html](https://sunaku.github.io/binman/man/man1/binman.1.html)
  * `binman text`
    [binman-rake](https://raw.github.com/sunaku/binman/master/bin/binman-rake)
    `>` [binman-rake.1.markdown](https://raw.github.com/sunaku/binman/gh-pages/man/man1/binman-rake.1.markdown)
  * `binman roff`
    [binman-rake](https://raw.github.com/sunaku/binman/master/bin/binman-rake)
    `>` [binman-rake.1](https://raw.github.com/sunaku/binman/gh-pages/man/man1/binman-rake.1)
  * `binman html`
    [binman-rake](https://raw.github.com/sunaku/binman/master/bin/binman-rake)
    `>` [binman-rake.1.html](https://sunaku.github.io/binman/man/man1/binman-rake.1.html)

## Installation

If you only want to view pre-built manual pages:

```sh
gem install binman
```

If you also want to build your own manual pages:

```sh
gem install md2man -v '~> 5.0'
```

### Prerequisites

  * Ruby 1.8.7 or 1.9.2 or newer.

### Development

```sh
git clone https://github.com/sunaku/binman
cd binman
bundle install
bundle exec binman --help # run it directly
bundle exec rake --tasks  # packaging tasks
```

## Usage

### At the command line

See binman(1) manual:

```sh
binman --help
```

### Inside a Ruby script

```ruby
#!/usr/bin/env ruby
# your program's manual page goes here

require 'binman'

# OPTION 1: show manual and exit if ARGV has -h or --help except after --
BinMan.help

# OPTION 2: show manual unconditionally
BinMan.show
```

You can also specify your program's source file encoding above the manual:

```ruby
#!/usr/bin/env ruby
# -*- coding: utf-8 -*-
# your program's manual page goes here
```

You can also write the manual as a multi-line Ruby comment:

```ruby
#!/usr/bin/env ruby
=begin
your program's manual page goes here
=end
```

You can also specify your program's source file encoding above the manual:

```ruby
#!/usr/bin/env ruby
# -*- coding: utf-8 -*-
=begin
your program's manual page goes here
=end
```

See the [API documentation][binman-api] for even more possibilities!

### Inside a shell script

```ruby
#!/usr/bin/sh
# your program's manual page goes here

# OPTION 1: show manual and exit if ARGV has -h or --help except after --
binman help "$0" "$@" && exit

# OPTION 2: show manual unconditionally
binman show "$0"
```

### Inside a Perl script

```perl
#!/usr/bin/env perl
# your program's manual page goes here

# OPTION 1: show manual and exit if ARGV has -h or --help except after --
system('binman', 'help', __FILE__, @ARGV) == 0 and exit;

# OPTION 2: show manual unconditionally
system('binman', 'show', __FILE__);
```

You can also write the manual as a multi-line Ruby comment after `__END__`:

```perl
#!/usr/bin/env perl
print "your program's code goes here";
__END__
=begin
your program's manual page goes here
=end
```

### Inside a Python script

```python
#!/usr/bin/env python
# your program's manual page goes here

import sys, subprocess

# OPTION 1: show manual and exit if ARGV has -h or --help except after --
subprocess.call(['binman', 'help', __file__] + sys.argv) == 0 and sys.exit()

# OPTION 2: show manual unconditionally
subprocess.call(['binman', 'show', __file__])
```

You can also specify your program's source file encoding above the manual:

```python
#!/usr/bin/env python
# -*- coding: utf-8 -*-
# your program's manual page goes here
```

You can also write the manual as a multi-line Ruby comment inside a docstring:

```python
#!/usr/bin/env python
"""
=begin
your program's manual page goes here
=end
"""
```

You can also specify your program's source file encoding above the manual:

```python
#!/usr/bin/env python
# -*- coding: utf-8 -*-
"""
=begin
your program's manual page goes here
=end
"""
```

### Inside an AWK script

The technique for determining current AWK script file name [comes from here](
http://www.mombu.com/programming/programming/t-the-name-of-script-itself-2040784-print.html
).

```awk
#!/usr/bin/awk -f
# your program's manual page goes here

# OPTION 1: show manual and exit if ARGV has -h or --help except after --
BEGIN {getline c <"/proc/self/cmdline"; sub(".*-f\0"," ",c); gsub("\0"," ",c);
       if(system("binman help" c) == 0){ exit }}

# OPTION 2: show manual unconditionally
BEGIN {getline c <"/proc/self/cmdline"; sub(".*-f\0"," ",c); sub("\0.*","",c);
       system("binman show" c)}
```

### Inside a Tcl script

```tcl
#!/usr/bin/env tclsh
# your program's manual page goes here

# OPTION 1: show manual and exit if ARGV has -h or --help except after --
if {![catch {exec -- >/dev/tty binman help $argv0 {*}$argv}]} {exit}

# OPTION 2: show manual unconditionally
exec >/dev/tty binman show $argv0
```

You can also write the manual as a multi-line Ruby comment inside an `if 0`:

```tcl
#!/usr/bin/env tclsh
if 0 {
=begin
your program's manual page goes here
=end
}
```

### Inside a Node.js script

```javascript
/*
=begin
your program's manual page goes here
=end
*/

var exec = require('child_process').exec;

// OPTION 1: show manual and exit if ARGV has -h or --help except after --
exec(['>/dev/tty', 'binman', 'help', __filename].concat(process.argv).
join(' '), function(error){ if (error === null){ process.exit(); } });

// OPTION 2: show manual unconditionally
exec(['>/dev/tty', 'binman', 'show', __filename].join(' '));
```

## Packaging

### Building man pages

#### At the command line

See binman-rake(1) manual:

```sh
binman-rake --help
```

#### Inside a Ruby script

Add this snippet to your gemspec file:

```ruby
s.files += Dir['man/man?/*.?']            # UNIX man pages
s.files += Dir['man/**/*.{html,css,js}']  # HTML man pages
s.add_development_dependency 'md2man', '~> 5.0'
```

Add the following line to your Rakefile:

```ruby
require 'binman/rakefile'
```

You now have a `rake binman` task that pre-builds UNIX manual page files for
your `bin/` scripts into a `man/` directory so that your end-users do not need
[md2man] installed in order to view the manual pages you've embedded therein!
There are also sub-tasks to build manual pages individually as [roff] or HTML.

If you're using Bundler, this task also hooks into its gem packaging tasks and
ensures that your UNIX manual pages are pre-built and packaged into your gem:

```shell
bundle exec rake build
gem spec pkg/*.gem | fgrep man/man
```

## License

Released under the ISC license.  See the LICENSE file for details.

[roff]: http://troff.org
[binman]: https://github.com/sunaku/binman
[binman-man]: https://sunaku.github.io/binman/man/man1/binman.1.html
[binman-api]: http://rubydoc.info/gems/binman/frames
[md2man]: https://github.com/sunaku/md2man
[md2man-markdown]: https://sunaku.github.io/md2man/man/man5/md2man.5.html
