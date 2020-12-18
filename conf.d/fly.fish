set --global _fly_symbol_prompt ❱
set --global _fly_color_reset (set_color normal)
set --global _fly_color_error (set_color $fish_color_error)
set --global _fly_color_base (set_color $fish_color_command)
set --global _fly_color_bold (set_color --bold)
set --global _fly_color_dim (set_color --dim)
set --global _fly_git_info _fly_git_info_$fish_pid

function $_fly_git_info --on-variable $_fly_git_info
    commandline --function repaint
end

function _fly_postexec --on-event fish_postexec
    test "$CMD_DURATION" -lt 1000 && set _fly_duration && return

    set --local secs (math --scale=1 $CMD_DURATION/1000 % 60)
    set --local mins (math --scale=0 $CMD_DURATION/60000 % 60)
    set --local hours (math --scale=0 $CMD_DURATION/3600000)

    test $hours -gt 0 && set --local --append out $hours"h"
    test $mins -gt 0 && set --local --append out $mins"m"
    test $secs -gt 0 && set --local --append out $secs"s"

    set --global _fly_duration "$_fly_color_dim$out$_fly_color_reset$_fly_color_base "
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
