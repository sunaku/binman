------------------------------------------------------------------------------
Version 0.1.2 (2011-10-13)
------------------------------------------------------------------------------

Housekeeping:

* Extracted `BinMan::Renderer` into [redcarpet-manpage] library.

* The [Redcarpet2] library is not a runtime gem dependency anymore.

* Forgot to introduce leading comment headers in binman(1) man page.

[Redcarpet2]: https://github.com/tanoku/redcarpet
[redcarpet-manpage]: http://rdoc.info/github/sunaku/redcarpet-manpage

------------------------------------------------------------------------------
Version 0.1.1 (2011-10-13)
------------------------------------------------------------------------------

New features:

* `BinMan.read()` now supports embedded document (=begin/=end) comments also.
  See binman(1) for the new, complete description of leading comment headers.

Bug fixes:

* Ignore encoding comment line after shebang line.

* roff: fix first paragraphs inside list items.

Housekeeping:

* gemspec: build man page files before building gem.

* binman: raise error and suggest --help option.

* README: add link to example of binman markdown.

* README: add obligatory screenshot! >:-)

------------------------------------------------------------------------------
Version 0.0.1 (2011-10-12)
------------------------------------------------------------------------------

* First release!  Happy birthday!  Woohoo!  :-)
