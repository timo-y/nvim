# nvim
my nvim config

# how to use
1. install nvim from here https://github.com/neovim/neovim/releases/nightly
2. (windows) clone repo into `$env:LOCALAPPDATA\nvim`
2. (linux) clone repo into `~/.config/nvim`
3. ONLY ON WINDOWS: open file `nvim/lua/timo/set.lua` and put `--` infront of line 15 and 16
4. open nvim via `nvim .`

# dependencies
## windows
- c compiler: download binaries here https://github.com/skeeto/w64devkitl, unzip and add to PATHs
- grep: download binaries here https://github.com/burntsushi/ripgrep and here https://github.com/sharkdp/fd, unzip and add to PATHs
- 

## linux
- use `apt get ...` to install the packages
  - TODO: provide list of packages
