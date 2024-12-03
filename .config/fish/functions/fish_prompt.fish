function fish_prompt
  echo '->'
end

function vantage -d "Open files equivalent to lenevo vantage"
   cd /sys/bus/platform/drivers/ideapad_acpi/VPC2004:00/
end

function mongoAtlas -d "Connect to MongoDB args : 1.Database 2.Username 3.Password" 
   mongosh "mongodb://ac-ydegyzv-shard-00-00.zdzszqo.mongodb.net:27017,ac-ydegyzv-shard-00-01.zdzszqo.mongodb.net:27017,ac-ydegyzv-shard-00-02.zdzszqo.mongodb.net:27017/"$argv[1]"?replicaSet=atlas-2b29wk-shard-0" --ssl --authenticationDatabase admin --username $argv[2] --password $argv[3]
end

function music
  mpv --playlist=~/Music/playlist.m3u --save-position-on-quit &; disown
end

function threeJS
  mpv --playlist=~/Three.js/playlist.m3u --save-position-on-quit &; disown
end

function series -d "Play series stored in video folder 1. Series name"
  mpv --playlist=~/Video/$argv[1]/playlist.m3u --save-position-on-quit &; disown
end

function update -d "Update the packages" 
   sudo apt update && sudo apt upgrade
end

function project
  cd /mnt/home/Projects/
  for name in $argv
    code $name
  end
end
