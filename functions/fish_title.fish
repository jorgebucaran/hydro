function fish_title --argument-names last_cmd
    string replace --all --regex -- \s\*\n "; " $last_cmd
    string replace ~ " ~" $PWD
end
