if status is-interactive
    # Commands to run in interactive sessions can go here
end
oh-my-posh init fish | source

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
eval conda "shell.fish" "hook" $argv | source
# <<< conda initialize <<<
