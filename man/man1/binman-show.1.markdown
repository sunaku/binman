# BINMAN-SHOW 1 2016-02-13 5.0.1

## NAME

binman-show - show manpage from header comment

## SYNOPSIS

`binman-show` [*OPTION*]... [*FILE*] [*PATTERN*]

## DESCRIPTION

Extracts the "embedded manpage source", described in binman-text(1), from the
given *FILE* or STDIN, transforms it into roff(7), and displays it in man(1).

If the optional *PATTERN* regular expression is specified, searches for it
inside the output displayed by man(1) and jumps to the first match if found.

If man(1) cannot display the roff(7) conversion, falls back to the displaying
the HTML conversion. And if that fails too, displays the manpage source as-is.

## OPTIONS

`-h` [*PATTERN*], `--help` [*PATTERN*]
  Show this help manual and optionally search for *PATTERN* regular expression.

## SEE ALSO

binman-text(1), binman-roff(1), binman-html(1), binman-help(1), binman(1)