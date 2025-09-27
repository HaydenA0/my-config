if [ -z "$KITTY_SCRIPT_RUNNING" ]; then
  fastfetch
fi
setopt AUTO_CD
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
(cat ~/.cache/wal/sequences &)
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"



zinit ice lucid wait'0' turbo
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
zinit ice depth=1 ; zinit light romkatv/powerlevel10k

export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=blue'
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-autosuggestions
zinit light marlonrichert/zsh-autocomplete
zinit light junegunn/fzf





alias count="ls -1 | wc -l"
alias ls='exa -lh --group-directories-first --icons --git --color=always; num_files=$(exa --all --classify | wc -l); echo -e "\033[1;32mNumber of files:\033[0m \033[1;33m${num_files}\033[0m"'

alias lsa="exa -lh --total-size"
alias lsaa="exa -lh --total-size -a"
alias timer="~/scripts/timer.sh"
alias zen="~/Zen/zen.linux-x86_64/zen/zen"
alias todo="zen https://app.todoist.com/app/today"

dup() {
  kitty -e zsh >/dev/null 2>&1 &
}

bright() {
  if [ $# -eq 0 ]; then
    echo "Usage: bright <percent>"
    return 1
  fi
  brightnessctl set "$1"% 
}

alias bluetooth="blueberry"
export PATH="$HOME/ghostty:$PATH"

vol() {
  if [ $# -eq 0 ]; then
    echo "Usage: vol <percent>"
    return 1
  fi
  pamixer --set-volume "$1"
}


ff() {
  local selected
  selected=$(find ./ -mindepth 1 \
  -not -path '*/.*' -not -name '.*' \
  -not -path '*/__*' -not -name '__*' | fzf)

  if [[ -n "$selected" ]]; then
    if [[ -d "$selected" ]]; then
      cd -- "$selected"
    elif [[ -f "$selected" ]]; then
      nvim -- "$selected"
    fi
  fi
}

cf() {
  local selected
  selected=$(find ~/ -mindepth 1 \
  -not -path '*/.*' -not -name '.*' \
  -not -path '*/__*' -not -name '__*' | fzf)

  if [[ -n "$selected" ]]; then
    if [[ -d "$selected" ]]; then
      cd -- "$selected"
    elif [[ -f "$selected" ]]; then
      nvim -- "$selected"
    fi
  fi
}

autoload -U colors && colors
alias reload="source ~/.zshrc"
source <(fzf --zsh)



alias c="clear"
unalias cd 2>/dev/null
cd() {
    if [ $# -eq 0 ]; then
        builtin cd ~ && ls
        return
    fi

    # Use z to jump to the directory
    z "$@" && ls
}

alias tree="eza --tree"
function mkvenv() {
  python -m venv .venv
  source .venv/bin/activate
  echo "Virtual environment '.venv' created and activated."
}


#eval the zis    
eval "$(zoxide init zsh)"



function ctl() {
    local options="󰃠 Brightness Up\n󰃞 Brightness Down\n Volume Up\n Volume Down\n󰝟 Toggle Mute\n󰤨 Network Manager (nmtui)\n󰒓 ActivityWatch Service\n🔌 Shutdown\n Reboot"
    
    # Requires Nerd Fonts for icons to display correctly
    local selected=$(echo -e "$options" | fzf --prompt="System Control > " --height=40% --border)

    case "$selected" in
        "󰃠 Brightness Up") brightnessctl set +5% ;;
        "󰃞 Brightness Down") brightnessctl set 5%- ;;
        " Volume Up") pamixer -i 5 ;;
        " Volume Down") pamixer -d 5 ;;
        "󰝟 Toggle Mute") pamixer -t ;;
        "󰤨 Network Manager (nmtui)") nmtui ;;
        "󰒓 ActivityWatch Service") systemctl --user status activitywatch.service ;;
        "🔌 Shutdown") sudo shutdown now ;;
        " Reboot") sudo reboot now ;;
    esac
}
function conf() {
  local config_files=$(find ~/.config -maxdepth 2 -type f | fzf --prompt="Edit Config > " --preview 'bat --color=always {}')
  if [[ -n $config_files ]]; then
    nvim "$config_files"
  fi
}
alias instalp="sudo pacman -S"
alias instaly="yay -S"
alias update="sudo pacman -Syu"
alias remov="sudo pacman -Rns"

auto_env() {
  # Deactivate Python venv if leaving a directory with no .venv
  if [[ -n "$VIRTUAL_ENV" && ! -d ".venv" ]]; then
    deactivate
    echo " Deactivated Python venv."
  fi

  # Activate .venv if it exists and is not active
  if [[ -d ".venv" && -z "$VIRTUAL_ENV" ]]; then
    echo " Activating .venv..."
    source .venv/bin/activate
  fi
}

# Register function to run on directory change
chpwd_functions+=("auto_env")

alias -s pdf='zathura'
alias -s md='nvim'
alias -s tex='nvim'
alias -s py='nvim'
alias -s c='nvim'
alias -s cpp='nvim'
alias -s js='nvim'
alias -s json='nvim'
alias -s conf='nvim'

# For media files
alias -s mp4='mpv'
alias -s mkv='mpv'
alias -s jpg='imv' # A simple image viewer for terminals/wayland
alias -s png='imv'
alias -s jpeg='imv'
alias -s /="cd"
    

# helkp function
alias help='/home/anasr/scripts/./help.sh'

  
function zle-keymap-select {
  if [[ $KEYMAP == vicmd ]]; then
    RPS1="< NORMAL >"
  else
    RPS1="> INSERT >"
  fi
  zle reset-prompt
}
zle -N zle-keymap-select



# -----------------------------------------------------------------------------
# File Copy/Paste for Wayland (Hyprland)
#
# Usage:
#   copy <file1> <folder2> ...   # Copies files/folders to the clipboard
#   past                          # Pastes files/folders from clipboard to CWD
# -----------------------------------------------------------------------------

# Function to copy file/folder paths to the Wayland clipboard
#
 
# Function to copy file/folder paths to the Wayland clipboard (IMPROVED & MORE ROBUST)
function copy() {
  # Ensure wl-copy is available
  if ! command -v wl-copy &> /dev/null; then
    echo "Error: wl-copy not found. Please install wl-clipboard." >&2
    return 1
  fi

  # Check if arguments are provided
  if [ "$#" -eq 0 ]; then
    echo "Usage: copy <file/folder> [file/folder...]" >&2
    echo "Tip: Remember to quote filenames with special characters (e.g., copy 'my file!')" >&2
    return 1
  fi

  local valid_paths=()
  local has_error=0

  # Loop through all provided arguments to validate them
  for arg in "$@"; do
    if [ -e "$arg" ]; then
      # If the file or directory exists, add it to our list
      valid_paths+=("$(realpath -- "$arg")")
    else
      # If it doesn't exist, print an error and mark that we had a problem
      echo "Error: Cannot find file or folder: '$arg'" >&2
      has_error=1
    fi
  done

  # If no valid paths were found after checking all args, exit.
  if [ ${#valid_paths[@]} -eq 0 ]; then
    echo "No valid files or folders to copy." >&2
    return 1
  fi

  # Join the array of valid paths with newlines, format as URIs,
  # and pipe to wl-copy.
  printf '%s\n' "${valid_paths[@]}" | sed 's,^,file://,' | wl-copy

  # Provide user feedback on what was actually copied
  echo "Copied ${#valid_paths[@]} item(s) to clipboard:"
  printf '%s\n' "${valid_paths[@]}"

  # Return a non-zero exit code if some files were not found
  return $has_error
}
 
 
 
# Function to paste files/folders from the Wayland clipboard (IMPROVED VERSION)
function past() {
  # Ensure wl-paste is available
  if ! command -v wl-paste &> /dev/null; then
    echo "Error: wl-paste not found. Please install wl-clipboard." >&2
    return 1
  fi

  # Get the URI list from the clipboard
  local clipboard_content=$(wl-paste)

  if [[ -z "$clipboard_content" ]]; then
    echo "Clipboard is empty." >&2
    return 1
  fi

  # Process each line from the clipboard
  echo "$clipboard_content" | while read -r uri; do
    # Check if the line is a file URI
    if [[ "$uri" != file://* ]]; then
      echo "Skipping non-file URI: $uri"
      continue
    fi

    # Remove the 'file://' prefix
    local encoded_path=${uri#file://}

    # URL-decode the path using Zsh's built-in parameter expansion `(%)`.
    # This is more robust than `zmodload zsh/url`.
    local decoded_path=${(%)encoded_path}

    # Check if the source file/folder actually exists before trying to copy
    if [ -e "$decoded_path" ]; then
      echo "Pasting: $decoded_path"
      # Use `cp -r` for recursive copy and `--` for safety
      cp -r -- "$decoded_path" .
    else
      echo "Error: Source path not found: '$decoded_path'" >&2
    fi
  done
}


function wallpaper() {
  wal -i "$1" --saturate 0.8 # Added saturate as you used it
  # You can also add commands here to reload Waybar, mako, etc.
  pkill hyprpaper
  hyprpaper &
}

alias cr="c && reload"

HISTFILE=~/.zsh_history
HISTSIZE=5000
SAVEHIST=5000
setopt append_history
setopt share_history


alias zshc="nvim .zshrc"
alias s="sudo"
alias vim="nvim"
alias vi="nvim"
alias v="nvim"
bindkey '^I' autosuggest-accept
bindkey '^[[Z' complete-word     
bindkey "$terminfo[kcbt]" menu-complete

alias tim="tty-clock"
alias download_audio="yt-dlp -f bestaudio"
alias download_video="yt-dlp"
alias class="hyprctl clients"
alias jn="jupytext --to notebook"
alias fm="yazi"



tman() {
    local memtotal_kb memfree_kb buffers_kb cached_kb used_gb

    echo "APP    TOTAL MEMORY (MB)"

    ps -eo comm,rss --no-headers | \
    awk '
      { app[$1] += $2/1024 }
      END {
        for (n in app)
          if (app[n] > 0) printf "%-8s %.2f\n", n, app[n]
      }' | sort -k2 -n

    echo ""

    # Read all required values from /proc/meminfo in a single awk call
    # The 'read' command assigns the space-separated output to variables
    read memtotal_kb memfree_kb buffers_kb cached_kb <<< "$(awk '
        /^MemTotal:/ { T=$2 }
        /^MemFree:/  { F=$2 }
        /^Buffers:/  { B=$2 }
        /^Cached:/   { C=$2 }
        END { print T, F, B, C }
    ' /proc/meminfo)"

    # The calculation remains the same
    used_gb=$(awk \
      -v T="$memtotal_kb" -v F="$memfree_kb" -v B="$buffers_kb" -v C="$cached_kb" \
      'BEGIN {
         used_kb = T - F - B - C
         used_gb  = used_kb/1024/1024
         printf "%d", used_gb + 0.5
      }'
    )

    echo "app mem"
    echo "-------"
    echo "MEM USAGE : $used_gb/24.0 GB"
}



export PATH=$PATH:/home/anasr/.spicetify
