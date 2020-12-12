function _fly_set_path --on-variable PWD
    set --global _fly_path (string replace ~ \~ $PWD | string replace --all --regex -- "/?.+/" "")
end

function _fly_uninstall --on-event fly_uninstall
    set --erase _fly_path
    functions --erase (functions --all | string match --entire --regex "^_fly_")
end

_fly_set_path