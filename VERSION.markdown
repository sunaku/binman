## Version 4.1.0 (2016-02-10)

### Minor:

  * Print path of HTML man page to STDOUT when launching browser.

### Patch:

  * Revert "ensure 'binman:web' task works the first time thru".

    This reverts commit dd0511e78e02546cac4903b5c6de6243607a8bba,
    which was causing the following error under Ruby 2.3.0p0.

      % rake build
      mkdir -p man/man1
      rake aborted!
      LoadError: cannot load such file -- md2man/rakefile.rb
      ./lib/binman/rakefile.rb:29:in `load'
      ./lib/binman/rakefile.rb:29:in `block in <top (required)>'
      Tasks: TOP => build => binman => binman:man
      (See full trace by running task with --trace)
      exit 1

  * Show HTML manual only as fallback to TTY man page.

    This prevents annoying browser launches every time you run `--help`.

  * `BinMan::show()` didn't always fallback to plain text header.

  * Don't override `man -P` pager; set `$LESS` and `$MORE` instead.

    Also, shell escaping the pattern prevents you from using regexp syntax.

  * `man FILE` isn't portable; use `man -M ...` instead.

    `man FILE` used to work in Debian, but doesn't work under Void Linux.

    `man -l FILE` works in Linux and OpenBSD but not on MacOSX / FreeBSD.

    Therefore, avoid all this portability mess using `man -M ...` instead.

  * Handle case where roff manual page is missing but HTML version exists.

## Version 4.0.0 (2014-10-26)

### Major:

  * binman(1): Rename the `load` command to `snip` and remove `conv`.

    * The `binman conv` command has been removed; use `md2man-roff` instead.

    * We no longer require a specific md2man version at runtime; any will do.

  * Upgrade to md2man 4.0, which no longer expands cross references in code
    spans and code blocks.  Your manuals might be rendered differently now.

## Version 3.4.1 (2014-07-01)

This release fixes the help options' REGEXP argument under non-Debian systems.

### Patch:

  * pager(1) isn't a universal command: CentOS uses `less -is` instead.

  * Silence man(1) stderr when displaying dynamically extracted manual.

### Other:

  * README: add intro hook and source+result examples.

  * Document REGEXP argument for help options in `bin/*`.

  * Refer to REGEXP argument as PATTERN like less does.

## Version 3.4.0 (2014-06-29)

### Minor:

  * GH-3: add optional regexp argument to `-h`/`--help` to search in man(1).

    The `-h` and `--help` options in `BinMan.help()` can now be optionally
    followed by a regular expression argument that specifies text to search
    for and, if found, jump to inside the displayed UNIX man page.  Such a
    regular expression argument can now also be passed into `BinMan.show()`.

### Other:

  * README: add syntax highlighting to code snippets.

## Version 3.3.3 (2014-06-22)

This release upgrades to md2man 3.0 for improved HTML manuals.

### Other:

  * README: add links to package, manuals, and GitHub.

  * GitHub now supports relative links from the README:

    https://help.github.com/articles/relative-links-in-readmes

  * Upgrade to md2man 3.0 for improved HTML manuals.

## Version 3.3.2 (2013-08-30)

Patch:

  * Rescue error when designated opener is not found:

        $ binman -h
        /gems/opener-0.1.0/lib/opener.rb:97:in `spawn': No such file or directory - xdg-open (Errno::ENOENT)
                from /gems/opener-0.1.0/lib/opener.rb:97:in `spawn'
                from /gems/binman-3.3.1/lib/binman.rb:57:in `block in show'
                from /gems/binman-3.3.1/lib/binman.rb:55:in `each'
                from /gems/binman-3.3.1/lib/binman.rb:55:in `show'
                from /gems/binman-3.3.1/lib/binman.rb:88:in `help'
                from /gems/binman-3.3.1/bin/binman:106:in `<top (required)>'
                from /bin/binman:23:in `load'
                from /bin/binman:23:in `<main>'

  * Fix an undefined local variable or method error:

        binman: undefined local variable or method `library' for BinMan:Module

Other:

  * Add screenshot to git repo since OmpLoader is dead.

## Version 3.3.1 (2013-06-01)

Patch:

  * Ensure that md2man 2.0 is loaded before running any BinMan rake tasks.

## Version 3.3.0 (2013-05-08)

Minor:

  * Add binman-rake(1) script to provide access to `binman/rakefile` tasks.

  * Always try showing HTML manual page in web browser from `BinMan.show()`.

Other:

  * Upgrade to md2man 2.0.0.

  * Rename HISTORY to VERSION so it sorts after README.

  * Add man/man0/ subdir containing README and VERSION.

## Version 3.2.1 (2013-05-04)

Patch:

  * Ensure that the `binman:web` Rake task works the first time through.

  * Fix "uninitialized constant Md2Man::VERSION" errors in `binman/rakefile`.

  * Hook into the `build` Rake task only if Bundler's Rake tasks are loaded:

    https://github.com/sunaku/md2man/pull/7#issuecomment-9467621

    Thanks to Postmodern for raising this issue.

## Version 3.2.0 (2012-10-14)

Minor:

  * add binman:web task to produce man pages in HTML

Other:

  * gemspec: package only roff files from inside man/

## Version 3.1.1 (2012-10-13)

Patch:

  * load() failed when leading comment header missing

  * lstrip() is too powerful; consume lines carefully

Other:

  * fix broken link to redcarpet library home page

## Version 3.1.0 (2012-02-06)

Minor:

  * Added `binman help` command for use by non-Ruby bin scripts.  See README
    for usage examples from Perl, Python, Node.js, Tcl, AWK, and UNIX shell!

Patch:

  * Replace `gem install binman --development` tip in `BinMan::conv()` with
    `gem install md2man` tip because the former just hangs in RubyGems 1.8.

Other:

  * Shorten markdown headings; improve documentation; clean up.

## Version 3.0.1 (2012-02-02)

Patch:

  * BinMan.help(): ignore `-h` and `--help` options after standard `--` flag.

  * BinMan.show(): write temp file because not all systems support `man -l`.

Other:

  * HISTORY: group changes by version number components.

  * README: add instructions on pre-building man pages.

  * README: fix installation commands for development.

  * bundler suggests moving all dev deps into gemspec.

## Version 3.0.0 (2012-01-09)

Major:

  * Removed the `binman/gemspec` helper library because it did not play well
    with Bundler.  Use the standard `add_runtime_dependency` method instead.
    [This example][1] shows what work is involved in upgrading.

Minor:

  * The `binman/Rakefile` helper library now hooks into Bundler's Rake tasks.
    Be sure to add the `man/**/*` files to your gemspec [accordingly][1].

[1]: https://github.com/sunaku/md2man/commit/75d7a0064fa86f1c98dd01391ad82245fd387c20

## Version 2.0.0 (2011-12-06)

Major:

  * Removed the deprecated `binman/rake_tasks` helper library.  Use
    `binman/rakefile` instead.

Patch:

  * Fixed infinite looping in the `binman/gemspec` helper library.

Other:

  * Upgraded to md2man v1 for Markdown to UNIX man page conversion.

  * Do not hard-code the version number in `binman/gemspec` helper.

## Version 1.1.0 (2011-11-05)

Alert:

  * The `binman/rake_tasks` library has been renamed (with deprecation) to
    `binman/rakefile`.  The deprecation warning will be removed in the next
    major release.

Minor:

  * Add `binman/gemspec` packaging convenience library which automatically
    builds and includes your UNIX man page files in your gem packages and also
    adds binman as a runtime and development gem dependency.

## Version 1.0.0 (2011-10-13)

Major:

  * The `BinMan::dump()` method and corresponding `binman dump` command now
    extract the leading comment header from their input before returning the
    markdown to roff conversion thereof.

  * The `BinMan::read()` method and corresponding `binman read` command have
    been renamed to `BinMan::load()` and `binman load` respectively.

Minor:

  * Added `BinMan::conv()` method and corresponding `binman conv` command to
    encapsulate the markdown to roff conversion process.

Patch:

  * Pre-built man pages included alongside a `bin/` script were not displayed.
    Instead, binman was (incorrectly) always trying to convert the leading
    comment header from the `bin/` script into a UNIX man page for display.

Other:

  * README: explain dev deps and `man/` dir packaging.

## Version 0.1.2 (2011-10-13)

Minor:

  * The [Redcarpet2] library is not a runtime gem dependency anymore.

Other:

  * Extracted `BinMan::Renderer` into [redcarpet-manpage] library.

  * Forgot to introduce leading comment headers in binman(1) man page.

[Redcarpet2]: https://github.com/tanoku/redcarpet
[redcarpet-manpage]: http://rdoc.info/github/sunaku/redcarpet-manpage

## Version 0.1.1 (2011-10-13)

Minor:

  * `BinMan.read()` now supports embedded document (=begin/=end) comments
    also.  See binman(1) for the new description of leading comment headers.

Patch:

  * Ignore encoding comment line after shebang line.

  * roff: fix first paragraphs inside list items.

Other:

  * gemspec: build man page files before building gem.

  * binman: raise error and suggest --help option.

  * README: add link to example of binman markdown.

  * README: add obligatory screenshot! >:-)

## Version 0.0.1 (2011-10-12)

First release!  Happy birthday!  Woohoo!  :-)
