# Description: Script to test if your Console or Terminal Emulator supports 24-bit true color (16 million colors)
# Author: Amna <http://github.com/aamnah>
# Date: 2025-02-22

# Check how many colors your Terminal supports
echo ""
echo -e "Colors supported: $(tput colors)"
echo ""
# 16 - only basic ANSI colors are supported
# 256 - supports 256 colors, but not necessarily true color
# 16777216 or higher - supports true color (24-bit RGB)

echo -e "\n == 256 COLORS ==\n"
printf "\e[48;2;255;0;0m   \e[0m\n"

echo "If it prints a solid red background, your terminal supports true color."
echo "If it prints a different color or nothing changes, true color is not supported or is misconfigured."
echo ""

awk 'BEGIN{
    s="/\\/\\/\\/\\/\\"; s=s s s s s s s s;
    for (colnum = 0; colnum<77; colnum++) {
        r = 255-(colnum*255/76);
        g = (colnum*510/76);
        b = (colnum*255/76);
        if (g>255) g = 510-g;
        printf "\033[48;2;%d;%d;%dm\033[38;2;%d;%d;%dm%s\033[0m",
            r, g, b, r, g, b, substr(s,colnum+1,1);
    }
    printf "\n";
}'

echo "If you see a smooth gradient from red to green to blue, your terminal supports true color."
echo "If the gradient looks blocky or wrong, true color is not fully supported."
echo ""

echo -e "\n == ANSI COLOR CODES == \n"
bash <(curl -s https://raw.githubusercontent.com/fidian/ansi/refs/heads/master/ansi) --color-codes