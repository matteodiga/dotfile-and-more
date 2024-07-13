# dotfile-and-more

This is my collection of configuration files/scripts and tools I use daily on my PC.\
By sharing these configurations I hope to help others, as well as myself, and facilitate configuration when changing environments or PCs.\
Feel free to take inspiration from the file.\
Avoid copying them as they are, some configurations that are essential for me could be inconvenient for you.

Enjoy :)

## Repo content

Here is a list of the configuration files included in this repository:

- `.bash_conf` -> custom settings for the Bash shell
- `.gitconfig` -> Git configuration, including aliases and user information
- `.tmux.conf` -> configuration for Tmux, with custom bar, keybinds and so more

Additionally, the repository includes the following directories:
- `.config` -> contains various subdirectories and files for application-specific configurations:
    - `git` -> gitk theme
    - `gitui` -> giuti theme
    - `i3` -> i3 and i3 blocks configuration file
    - `nvim` -> configuration file for neovim
    - `rofi` -> rofi theme
- `misc` -> contains various file for applications (non shell too):
    - `vimium-options.json` -> browser extension configuration file for keyboard-based vim style navigation
- `tmux` -> custom script used by tmux

## Useful Tools

Here the list of useful applications I use without custom configuration file (just to track them):

- `PatchPicker`(fpp) -> parse stdout input at present it in UI to pick the file you want (https://github.com/facebook/PathPicker/blob/main/fpp)
- `i3lock` -> alternative i3lock that display time (https://github.com/Lixxia/i3lock)
- `hstr` -> bash shell history suggest box - easy view, navigate, search (https://github.com/dvorka/hstr)
- `fasd` -> quick access to files and directories based on access frequency (https://github.com/clvv/fasd)


---

**Note:** Be sure to back up your original configuration files before replacing them with the ones in this repository. Some settings may be tailored to my personal workflow and might require adjustments to fit your needs.
