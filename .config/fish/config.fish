set fish_greeting ""

alias clock="tty-clock -c -r"
alias ls="exa -l"
alias la="exa -la"

export DOCKER_HOST=$(docker context inspect --format '{{.Endpoints.docker.Host}}')

function creboot -d "Reboot the system 1. boot-entry"
  if test -z $argv
    systemctl reboot
  else if test $argv[1] = "windows"
    systemctl reboot --boot-loader-entry=auto-windows
  else if test $argv[1] = "arch"
    systemctl reboot --boot-loader-entry=arch.conf
  else if test $argv[1] = "bios"
    systemctl reboot --firmware-setup
  else
    echo "Invalid argument"
  end
end 

function vpn-start
  sudo openvpn --config /etc/openvpn/client/client.ovpn --auth-user-pass /etc/openvpn/client/pass.txt
end

function start-mongo -d "Start MongoDB"
  sudo systemctl start mongodb
  systemctl status mongodb
end

function stop-mongo -d "Stop MongoDB instance"
  sudo systemctl stop mongodb
end

function webkill -d "Kill the process running on the given port"
  sudo kill -9 $(sudo lsof -t -i:$argv[1])
end

function go-install -d "Install Go with given version (latest by default)"
  if count $argv > /dev/null
    export GOPKG=$argv[1]
  else 
    export GOPKG="$(curl -s https://api.github.com/repos/golang/go/git/matching-refs/tags/go | grep ref | grep -v url | grep -v beta | tail -1 | awk -F\/ {' print $3 '} | sed 's/",//')"
  end
  
  echo "Installing $GOPKG..."

  wget https://go.dev/dl/$GOPKG.linux-amd64.tar.gz
  # Remove /usr/local/bin
  if test -d /usr/local/go
    sudo rm -rf /usr/local/go;
  end
  sudo tar -C /usr/local -xzf $GOPKG.linux-amd64.tar.gz

  rm $GOPKG.linux-amd64.tar.gz
end

function prisma-install -d "Install Prisma 1. yarn | npm "
  if test $argv[1] = "yarn"
    yarn add -D prisma@4.8.1; yarn add @prisma/client@4.8.1;
  else if test $argv[1] = "npm"
    npm i save-dev prisma@4.8.1; npm i yarn add @prisma/client@4.8.1;
  else
    echo "Invalid argument"
  end
end

function music
  mpv --playlist=/home/shurtu-gal/Music/playlist.m3u --shuffle &; disown
end

function threeJS
  mpv --playlist=/home/shurtu-gal/Three.js/playlist.m3u --save-position-on-quit &; disown
end

function series -d "Play series stored in video folder 1. Series name"
  mpv --playlist=/home/shurtu-gal/Video/$argv[1]/playlist.m3u --save-position-on-quit &; disown
end

function vantage -d "Open files equivalent to lenevo vantage"
   cd /sys/bus/platform/drivers/ideapad_acpi/VPC2004:00/
end

function mongoAtlas -d "Connect to MongoDB args : 1.Database 2.Username 3.Password" 
   mongosh "mongodb://ac-ydegyzv-shard-00-00.zdzszqo.mongodb.net:27017,ac-ydegyzv-shard-00-01.zdzszqo.mongodb.net:27017,ac-ydegyzv-shard-00-02.zdzszqo.mongodb.net:27017/"$argv[1]"?replicaSet=atlas-2b29wk-shard-0" --ssl --authenticationDatabase admin --username $argv[2] --password $argv[3]
end


function update -d "Update the packages" 
    sudo pacman -S
end

function project
  cd ~/Projects/
  for name in $argv
    code $name
  end
end

set -u ANDROID_HOME ~/Projects/appDev/installs/android
set -u JAVA_HOME ~/Projects/appDev/installs/jdk-17

if status is-interactive
    clear 
    pfetch
    #curl -L git.io/unix
    echo Hello Ashish  
end

starship init fish | source

set --export MANPATH /usr/share/man
fish_add_path /home/shurtu-gal/scripts/

set XDG_CONFIG_HOME $HOME/.config
set EDITOR nvim

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH

# npm
set NPM_PACKAGES "$HOME/.npm-packages"
fish_add_path $NPM_PACKAGES/bin
export NODE_OPTIONS='--disable-warning=ExperimentalWarning'

# gtk
set GTK2_RC_FILES /usr/share/themes/Adwaita-dark/gtk-2.0/gtkrc
set GTK_THEME Adwaita:dark

#ssh
set SSH_AUTH_SOCK $XDG_RUNTIME_DIR/gcr/ssh
export SSH_AUTH_SOCK=/run/user/1000/gcr/ssh

#golang
set --export GOINSTALL "/usr/local/go/bin/"
set --export PATH $GOINSTALL $PATH

fish_add_path /home/shurtu-gal/.local/bin

# pnpm
set -gx PNPM_HOME "/home/shurtu-gal/.local/share/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end
