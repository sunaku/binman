# BINMAN-TEXT 1 2016-02-13 5.0.1

## NAME

binman-text - extract embedded manpage sources

## SYNOPSIS

`binman-text` [*OPTION*]... [*FILE*]

## DESCRIPTION

Prints the "embedded manpage source" extracted from the given *FILE* or STDIN.

### Embedded manpage sources

An "embedded manpage source" is an md2man(5) document that is embedded in your
script, typically inside a multi-line block comment or "here document"; or in
a header comment composed of single-line comments near the top of your script.

#### In multi-line comments

In the former case, where it's possible to write a freeform block of text, the
embedded manpage source must be delimited by `=begin` and `=end` lines, which
start with their respective delimiters and, optionally, continue with a single
space followed by any amount and kind of characters until the end of line.

To illustrate, here is the simplest case:

    =begin
    This is an embedded manpage source!
    =end

Next, we can add decorations after the delimiters:

    =begin \\\\\\\\\\\\\\\\\\\\\\\\\\\\
    This is an embedded manpage source!
    =end //////////////////////////////

Similarly, using different characters this time:

    =begin abcdefghijklmnopqrstuvwxyz'"
    This is an embedded manpage source!
    =end 0123456789!@#$%^&*()=+-_:;,\/?

#### In single-line comments

In the latter case, the embedded manpage source is expected to be found in a
contiguous block of single-line comments that begins at the top of the script
(optionally after a `#!` line, `coding:` line, and any number of blank lines)
and ends at the first blank line.  Each single-line comment inside this block
must begin with a `#` character and may, optionally, continue with a single
space followed by any amount and kind of characters until the end of line.

To illustrate, here is the simplest case:

    # This is an embedded manpage source!

Next, we can add a `#!` line at the top:

    #!/bin/sh
    # This is an embedded manpage source!

Next, we can add a `coding:` line after `#!`:

    #!/bin/sh
    # coding: utf-8
    # This is an embedded manpage source!

Or, using the Emacs coding system syntax:

    #!/bin/sh
    # -*- encoding: utf-8 -*-
    # This is an embedded manpage source!

Next, we can add blank lines between them:

    #!/bin/sh
    # coding: utf-8

    # This is an embedded manpage source!

Here is another permutation of the above:

    #!/bin/sh

    # This is an embedded manpage source!

## OPTIONS

`-h` [*PATTERN*], `--help` [*PATTERN*]
  Show this help manual and optionally search for *PATTERN* regular expression.

## SEE ALSO

md2man(5), binman-roff(1), binman-html(1), binman(1)