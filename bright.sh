#!/bin/sh

# Extended Script to display colors for Terminal color values
#   Displays only bright colors. 
#   If you don't see two different shades for bright colors,
#   your terminal emulator/console quite possibly does not support bright colors
#
#   This file echoes a bunch of color codes to the 
#   terminal to demonstrate what's available.  Each 
#   line is the color code of one forground color,
#   out of 17 (default + 16 escapes), followed by a 
#   test use of that color on all nine background 
#   colors (default + 8 escapes).
#
#   Author: Aamnah
#   URL: https://aamnah.com
#
#   Based on: 
#   Daniel Crisman's ANSI color chart script from
#   The Bash Prompt HOWTO: 6.1. Colours
#   http://www.tldp.org/HOWTO/Bash-Prompt-HOWTO/x329.html

# printf '\e[42;31m%s\e[m%s\n' some text
# - \e[ signals the start of an escape code.
# - 42 sets the background to color 2
# - 31 sets the foreground to color 1
# - m signals the end of an escape code
# - \e[m resets the colors to the default.
# - 0; means reset/normal
# - 1; means bold
# - 2; means faint
# - 3; means italic
# - 4; means underlined

# if you don't see bold or italic, see if your font has those variants
# OR if your console or terminal emulator supports it.

# if your terminal isn't rendering italic text
# see: https://unix.stackexchange.com/a/740600
# infocmp $TERM | grep -e sitm -e ritm

echo "
0; means reset/normal
1; should be bold
2; should be faint
3; should be italic
4; should be underlined

9x are foreground colors
10x are background colors
"

TEXT='gYw'   # The test text

echo -e "\n                 100     101     102     103 \
    104     105     106     107"

for FGs in  '    0' \
            '   90' \
            ' 1;90' \
            ' 2;90' \
            ' 3;90' \
            ' 4;90' \
            '   91' \
            ' 1;91' \
            ' 2;91' \
            ' 3;91' \
            ' 4;91' \
            '   92' \
            ' 1;92' \
            ' 2;92' \
            ' 3;92' \
            ' 4;92' \
            '   93' \
            ' 1;93' \
            ' 2;93' \
            ' 3;93' \
            ' 4;93' \
            '   94' \
            ' 1;94' \
            ' 2;94' \
            ' 3;94' \
            ' 4;94' \
            '   95' \
            ' 1;95' \
            ' 2;95' \
            ' 3;95' \
            ' 4;95' \
            '   96' \
            ' 1;96' \
            ' 2;96' \
            ' 3;96' \
            ' 4;96' \
            '   97' \
            ' 1;97' \
            ' 2;97' \
            ' 3;97' \
            ' 4;97' \

do FG=${FGs// /}
  echo -en " $FGs \033[${FG}m  $TEXT  "
  for BG in 100 101 102 103 104 105 106 107;
    do echo -en " \033[${FG}m\033[${BG}m  $TEXT  \033[0m"
    done
  echo
done
echo