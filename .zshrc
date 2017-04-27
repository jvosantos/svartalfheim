source ~/.antigen/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git

# Syntax highlighting bundle.
# antigen bundle zsh-users/zsh-syntax-highlighting

# Load the theme.
antigen theme gallois

# Tell Antigen that you're done.
antigen apply

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/vasco/bin/google-cloud-sdk/path.zsh.inc' ]; then source '/Users/vasco/bin/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/vasco/bin/google-cloud-sdk/completion.zsh.inc' ]; then source '/Users/vasco/bin/google-cloud-sdk/completion.zsh.inc'; fi


