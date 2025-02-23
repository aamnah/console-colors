#!/bin/sh

SUPPORTED_COLORS=$(tput colors)
TEXT_REGULAR="Regular"
TEXT_BOLD="$(tput sgr0)$(tput bold)Bold$(tput sgr0)"
TEXT_BOLD_2="\033[1mBold\033[0m"
TEXT_ITALIC="\033[3mItalic\033[0m"
TEXT_UNDERLINE="\033[4mUnderline\033[0m"
TEXT_BOLD_ITALIC_UNDERLINE="\033[1;3;4mBoldItalicUnderline\033[0m"
TEXT_INVERT=""


show_info()
{
  echo -e "\n Console or Terminal Emulator: $TERM"

  # Show how many colors your Terminal supports
  echo -e " Supported colors: $(tput colors)"
  # 16 - only basic ANSI colors are supported
  # 256 - supports 256 colors, but not necessarily true color
  # 16777216 or higher - supports true color (24-bit RGB)
  
  echo -e "\n ${TEXT_REGULAR} ${TEXT_BOLD} ${TEXT_ITALIC} ${TEXT_UNDERLINE} ${TEXT_BOLD_ITALIC_UNDERLINE}"
}

show_info