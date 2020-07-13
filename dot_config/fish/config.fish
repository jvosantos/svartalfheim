# Theme custom configurations found at:
# Greeting: ~/.config/fish/functions/fish_greeting.fish
# ~/.config/fish/functions/fish_mode_prompt.fish
# ~/.config/fish/functions/fish_right_prompt.fish
# ~/.config/fish/functions/fish_title.fish

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

