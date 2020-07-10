
# set in ~/.config/fish/functions/fish_greeting.fish
# function fish_greeting sygin_greeting
function sygin_greeting -d "sigyin hello"
#       .-'''-. .-./`)   .-_'''-.      ____     __ ,---.   .--.
#      / _     \\ .-.') '_( )_   \     \   \   /  /|    \  |  |
#     (`' )/`--'/ `-' \|(_ o _)|  '     \  _. /  ' |  ,  \ |  |
#    (_ o _).    `-'`"`. (_,_)/___|      _( )_ .'  |  |\_ \|  |
#     (_,_). '.  .---. |  |  .-----. ___(_ o _)'   |  _( )_   |
#    .---.  \  : |   | '  '\ '-   .'|   |(_,_)'    | (_ o _)  |
#    \    `-'  | |   |  \  `-'`   | |   `-'  /     |  (_,_)   |
#     \       /  |   |   \        /  \      /      |  |    |  |
#      `-...-'   '---'    `'-...-'    `-..-'       '--'    '--'
    echo "                                                          "
    echo "   .-'''-. .-./`)   .-_'''-.      ____     __ ,---.   .--."
    echo "  / _     \\\\ .-.') '_( )_   \     \   \   /  /|    \  |  |"
    echo " (`' )/`--'/ `-' \|(_ o _)|  '     \  _. /  ' |  ,  \ |  |"
    echo "(_ o _).    `-'`\"`. (_,_)/___|      _( )_ .'  |  |\_ \|  |"
    echo " (_,_). '.  .---. |  |  .-----. ___(_ o _)'   |  _( )_   |"
    echo ".---.  \  : |   | '  '\ '-   .'|   |(_,_)'    | (_ o _)  |"
    echo "\    `-'  | |   |  \  `-'`   | |   `-'  /     |  (_,_)   |"
    echo " \       /  |   |   \        /  \      /      |  |    |  |"
    echo "  `-...-'   '---'    `'-...-'    `-..-'       '--'    '--'"
    echo "                                                          "
    echo "=========================================================="
end

set -x PATH /usr/local/opt/coreutils/libexec/gnubin $PATH
set -x PATH /usr/local/opt/grep/libexec/gnubin $PATH

set -x EDITOR vim

set -x LC_ALL en_US.UTF-8
set -x LANG en_US.UTF-8

alias ls='gls --color=auto'

# Bootstrap fisher
if not functions -q fisher
    set -q XDG_CONFIG_HOME; or set XDG_CONFIG_HOME ~/.config
    curl -sLo $XDG_CONFIG_HOME/fish/functions/fisher.fish --create-dirs https://git.io/fisher
    fish -c fisher
end

# Bootstrap Brew
if not brew bundle check --global > /dev/null
    brew bundle install --global
end

