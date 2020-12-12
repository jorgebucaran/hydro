function _fly_set_path --on-variable PWD
    set --global _fly_path (string replace ~ \~ $PWD | string replace --all --regex -- "/?.+/" "")
end

_fly_set_path

function fly_uninstall --on-event fly_uninstall
    set --erase _fly_path
    functions --erase _fly_set_path fly_uninstall _fly_on_fish_prompt
end