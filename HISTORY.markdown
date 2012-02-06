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
