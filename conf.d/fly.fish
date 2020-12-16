set --global _fly_git_status _fly_git_status_$fish_pid
set --global _fly_init
set --global _fly_color_dim (set_color --dim)
set --global _fly_color_base (set_color $fish_color_command)
set --global _fly_color_error (set_color $fish_color_error)
set --global _fly_color_reset (set_color normal)
set --global _fly_symbol_prompt ❯

function _fly_uninstall --on-event fly_uninstall
    set --names | string replace --filter --regex "^_fly_" -- "set --erase _fly_" | source
    functions --erase (functions --all | string match --entire --regex "^_fly_")
end
