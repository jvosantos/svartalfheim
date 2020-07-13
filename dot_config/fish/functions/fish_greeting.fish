function fish_greeting -d "What's up, fish?"

#       .-'''-. .-./`)   .-_'''-.      ____     __ ,---.   .--.
#      / _     \\ .-.') '_( )_   \     \   \   /  /|    \  |  |
#     (`' )/`--'/ `-' \|(_ o _)|  '     \  _. /  ' |  ,  \ |  |
#    (_ o _).    `-'`"`. (_,_)/___|      _( )_ .'  |  |\_ \|  |
#     (_,_). '.  .---. |  |  .-----. ___(_ o _)'   |  _( )_   |
#    .---.  \  : |   | '  '\ '-   .'|   |(_,_)'    | (_ o _)  |
#    \    `-'  | |   |  \  `-'`   | |   `-'  /     |  (_,_)   |
#     \       /  |   |   \        /  \      /      |  |    |  |
#      `-...-'   '---'    `'-...-'    `-..-'       '--'    '--'

#    # Uncolored
#    echo "                                                          "
#    echo "   .-'''-. .-./`)   .-_'''-.      ____     __ ,---.   .--."
#    echo "  / _     \\\\ .-.') '_( )_   \     \   \   /  /|    \  |  |"
#    echo " (`' )/`--'/ `-' \|(_ o _)|  '     \  _. /  ' |  ,  \ |  |"
#    echo "(_ o _).    `-'`\"`. (_,_)/___|      _( )_ .'  |  |\_ \|  |"
#    echo " (_,_). '.  .---. |  |  .-----. ___(_ o _)'   |  _( )_   |"
#    echo ".---.  \  : |   | '  '\ '-   .'|   |(_,_)'    | (_ o _)  |"
#    echo "\    `-'  | |   |  \  `-'`   | |   `-'  /     |  (_,_)   |"
#    echo " \       /  |   |   \        /  \      /      |  |    |  |"
#    echo "  `-...-'   '---'    `'-...-'    `-..-'       '--'    '--'"
#    echo "                                                          "
#    echo "=========================================================="

    # Colored
    set red "\e[31m"
    set green "\e[32m"
    set yellow "\e[33m"
    set blue "\e[34m"
    set magenta "\e[35m"
    set cyan "\e[36m"
    set blank  "\e[m"

    echo -e "$green                                                          $blank"
    echo -e "$green   .-'''-. $blue.-./`)$green   .-"$magenta"_"$green"'''-.      ____     __ ,---.   .--.$blank"
    echo -e "$green  / "$red"_$green     \\\\$blue\\\ $yellow.-.$blue')$green '"$magenta"_( )_$green   \     \   \   /  /|    \  |  |$blank"
    echo -e "$green $red(`' )$green/`--'$blue/ $yellow`-'$blue \\\\$green|$magenta(_ "$cyan"o$magenta _)$green|  '     \  "$yellow"_$green. /  ' |  ,  \ |  |$blank"
    echo -e "$green$red(_ "$magenta"o$red _)$green.    $blue`-'`\"`$green. $magenta(_,_)$green/___|      "$yellow"_( )_$green .'  |  |\\\\"$cyan"_$green \|  |$blank"
    echo -e "$green $red(_,_)$green. '.  .---. |  |  .-----. ___$yellow(_ "$red"o$yellow _)$green'   |  "$cyan"_( )_$green   |$blank"
    echo -e "$green.---.  \  : |   | '  '\ '-   .'|   |$yellow(_,_)$green'    | $cyan(_ "$blue"o$cyan _)$green  |$blank"
    echo -e "$green\    `-'  | |   |  \  `-'`   | |   `-'  /     |  $cyan(_,_)$green   |$blank"
    echo -e "$green \       /  |   |   \        /  \      /      |  |    |  |$blank"
    echo -e "$green  `-...-'   '---'    `'-...-'    `-..-'       '--'    '--'$blank"
    echo -e "$green                                                          $blank"
    echo -e "=========================================================="

    set_color $fish_color_autosuggestion
    uname -nmsr

    # TODO: `command -q -s` only works on fish 2.5+, so hold off on that for now
    command -s uptime >/dev/null
    and command uptime

    set_color normal
end
