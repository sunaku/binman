# BINMAN-RAKE 1 2016-02-13 5.0.1

## NAME

binman-rake - run rake(1) tasks from binman(1)

## SYNOPSIS

`binman-rake` [*OPTION*]... [*TASK*]...

## DESCRIPTION

This program lets you run rake(1) tasks provided by binman(1) without having
to create a special file named `Rakefile` that contains the following snippet:

    require 'binman/rakefile'

If no *TASK* is specified, then the `binman` task is run by default.

## TASKS

`binman`
  Runs the `binman:man` and `binman:web` tasks, in that order.

`binman:mkd`
  Extracts manual page sources embedded in scripts found in your `bin/`
  directory and saves them as `man/man1/*.1.markdown` files, which can
  then be rendered as HTML or UNIX manual pages using md2man-rake(1).

`binman:man`
  Builds UNIX manual pages from scripts found in your `bin/` directory.
  It also runs the `md2man:man` task, provided by md2man-rake(1), which
  builds UNIX manual pages from `*.markdown`, `*.mkd`, and `*.md` files
  found in or beneath the `man/` subdirectory in your working directory.

`binman:web`
  Builds HTML manual pages from scripts found in your `bin/` directory.
  It also runs the `md2man:web` task, provided by md2man-rake(1), which
  builds HTML manual pages from `*.markdown`, `*.mkd`, and `*.md` files
  found in or beneath the `man/` subdirectory in your working directory.

## OPTIONS

`-h` [*PATTERN*], `--help` [*PATTERN*]
  Show this help manual and optionally search for *PATTERN* regular expression.

...
  Anything else is passed to rake(1); run `rake --help` for documentation.

## SEE ALSO

rake(1), binman(1), md2man-rake(1)