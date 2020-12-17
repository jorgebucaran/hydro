set --global _fly_symbol_prompt ❱
set --global _fly_color_reset (set_color normal)
set --global _fly_color_error (set_color $fish_color_error)
set --global _fly_color_base (set_color $fish_color_command)
set --global _fly_color_dim (set_color --dim)
set --global _fly_git_info _fly_git_info_$fish_pid

function $_fly_git_info --on-variable $_fly_git_info
    commandline --function repaint
end

function _fly_fish_exit --on-event fish_exit
    set --erase $_fly_git_info
end

function _fly_uninstall --on-event fly_uninstall
    set --names \
        | string replace --filter --regex "^_fly_" -- "set --erase _fly_" \
        | source
    functions --erase $_fly_git_info _fly_fish_exit _fly_uninstall
end

status is-interactive && _fly_git_info && _fly_pwd_info
