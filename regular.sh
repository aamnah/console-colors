#!/bin/sh

#   Extended Script to display colors for Terminal color values
#   Displays regular colors
#
#   This file echoes a bunch of color codes to the 
#   terminal to demonstrate what's available.  Each 
#   line is the color code of one foreground color,
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

3x are foreground colors
4x are background colors
"

TEXT='gYw'   # The test text

echo -e "\n                  40      41      42      43\
      44      45      46      47"

for FGs in  '    0' \
            '  1;0' \
            '  2;0' \
            '  3;0' \
            '  4;0' \
            '   30' \
            ' 1;30' \
            ' 2;30' \
            ' 3;30' \
            ' 4;30' \
            '   31' \
            ' 1;31' \
            ' 2;31' \
            ' 3;31' \
            ' 4;31' \
            '   32' \
            ' 1;32' \
            ' 2;32' \
            ' 3;32' \
            ' 4;32' \
            '   33' \
            ' 1;33' \
            ' 2;33' \
            ' 3;33' \
            ' 4;33' \
            '   34' \
            ' 1;34' \
            ' 2;34' \
            ' 3;34' \
            ' 4;34' \
            '   35' \
            ' 1;35' \
            ' 2;35' \
            ' 3;35' \
            ' 4;35' \
            '   36' \
            ' 1;36' \
            ' 2;36' \
            ' 3;36' \
            ' 4;36' \
            '   37' \
            ' 1;37' \
            ' 2;37' \
            ' 3;37' \
            ' 4;37' 

do FG=${FGs// /}
  echo -en " $FGs \033[${FG}m  $TEXT  "
  for BG in 40 41 42 43 44 45 46 47;
    do echo -en " \033[${FG}m\033[${BG}m  $TEXT  \033[0m"
    done
  echo
done
echo

# test bold: echo "`tput sgr0`this is `tput bold`bold`tput sgr0`"
# test bold: echo -e "text \033[1mbold\033[0m text"
# test italic: echo -e "\e[3mabcd\e[23m"
# test red, bold, underline: echo -e "\033[31;1;4mHello\033[0m"
