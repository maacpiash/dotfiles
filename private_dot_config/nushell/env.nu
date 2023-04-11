# To add entries to PATH (on Windows you might use Path), you can use the following pattern:
# let-env PATH = ($env.PATH | split row (char esep) | prepend '/some/path')

mkdir ~/.cache/starship
starship init nu | save -f ~/.cache/starship/init.nu 
