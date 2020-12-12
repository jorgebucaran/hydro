set --global _fly_start
set --global _fly_color_error (set_color --bold $fish_color_error)
set --global _fly_color_accent (set_color $fish_color_command)
set --global _fly_color_normal (set_color normal)

function _fly_uninstall --on-event fly_uninstall
    set --names | string replace --filter --regex "^_fly_" -- "set --erase _fly_" | source
    functions --erase (functions --all | string match --entire --regex "^_fly_")
end