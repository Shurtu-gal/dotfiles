function play --description "MPV - Custom"
    mpv $argv[1] --save-position-on-quit & disown & exit
end
