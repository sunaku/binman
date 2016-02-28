# BINMAN-HELP 1 2016-02-13 5.0.1

## NAME

binman-help - add help options to your program

## SYNOPSIS

`binman-help` *FILE* ... [`-h`|`--help` [*PATTERN*]] ... [`--`] ...

## DESCRIPTION

If the given argument sequence contains `-h` or `--help`, except after `--`,
then this program displays the given *FILE*'s "embedded manpage source",
described in binman-text(1), and then terminates with exit status `0`.
Otherwise, this program terminates with the nonzero exit status `111`.

## OPTIONS

`-h` [*PATTERN*], `--help` [*PATTERN*]
  Display manpage and optionally search for *PATTERN* regular expression.

## EXIT STATUS

0
  Arguments contained help options so manpage was displayed.

111
  Arguments lacked help options so manpage was not displayed.

## SEE ALSO

binman-text(1), binman-roff(1), binman-html(1), binman-show(1), binman(1)