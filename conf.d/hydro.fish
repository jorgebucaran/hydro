set --global _hydro_symbol_prompt ❱
set --global _hydro_symbol_git_dirty •
set --global _hydro_symbol_git_ahead ↑
set --global _hydro_symbol_git_behind ↓

set --global _hydro_color_error (set_color $fish_color_error)
set --global _hydro_color_base (set_color $fish_color_command)
set --global _hydro_color_pwd (set_color $fish_color_command)
set --global _hydro_git_info _hydro_git_info_$fish_pid

function _hydro_pwd_info --on-variable PWD
    set --query fish_prompt_pwd_dir_length || set --local fish_prompt_pwd_dir_length 1
    set --local base (git rev-parse --show-toplevel 2>/dev/null | string replace --all --regex -- "^.*/" "")
    set --global _hydro_pwd_info (
        string replace --ignore-case -- ~ \~ $PWD | \
        string replace -- "/$base/" /:/ | \
        string replace --regex --all -- "(\.?[^/]{$fish_prompt_pwd_dir_length})[^/]*/" \$1/ | \
        string replace -- : "$base" | \
        string replace --regex -- "(?!^~\$)([^/]*)\$" "\x1b[1m\$1\x1b[22m" | \
        string replace --regex --all -- / "\x1b[2m/\x1b[22m"
    )
end

function $_hydro_git_info --on-variable $_hydro_git_info
    commandline --function repaint
end

function _hydro_git_info --on-event fish_prompt
    command kill $_hydro_last_pid 2>/dev/null

    fish --private --command "
        ! set branch (
            command git symbolic-ref --short HEAD 2>/dev/null ||
            command git describe --tags --exact-match HEAD 2>/dev/null ||
            command git rev-parse --short HEAD 2>/dev/null | string replace --regex -- '(.+)' '@\$1'
        ) && set $_hydro_git_info && exit

        ! git diff-index --quiet HEAD 2>/dev/null || \
        count (command git ls-files --others --exclude-standard) >/dev/null && set state $_hydro_symbol_git_dirty

        for step in fetch exit
            command git rev-list --count --left-right @{upstream}...@ 2>/dev/null | read behind ahead

            switch \"\$behind \$ahead\"
                case \" \" \"0 0\"
                case \"0 *\"
                    set upstream \" $_hydro_symbol_git_ahead\$ahead\"
                case \"* 0\"
                    set upstream \" $_hydro_symbol_git_behind\$behind\"
                case \*
                    set upstream \" $_hydro_symbol_git_ahead\$ahead $_hydro_symbol_git_behind\$behind\"
            end

            set --universal $_hydro_git_info \"\$branch\$state\$upstream \"

            test \$step = fetch && command git fetch --no-tags 2>/dev/null
        end
    " &
    set --global _hydro_last_pid (jobs --last --pid)
end

function _hydro_postexec --on-event fish_postexec
    test "$CMD_DURATION" -lt 1000 && set _hydro_cmd_duration && return

    set --local secs (math --scale=1 $CMD_DURATION/1000 % 60)
    set --local mins (math --scale=0 $CMD_DURATION/60000 % 60)
    set --local hours (math --scale=0 $CMD_DURATION/3600000)

    test $hours -gt 0 && set --local --append out $hours"h"
    test $mins -gt 0 && set --local --append out $mins"m"
    test $secs -gt 0 && set --local --append out $secs"s"

    set --global _hydro_cmd_duration "\x1b[2m$out\x1b[22m "
end

function _hydro_fish_exit --on-event fish_exit
    set --erase $_hydro_git_info
end

function _hydro_uninstall --on-event hydro_uninstall
    set --names \
        | string replace --filter --regex "^_hydro_" -- "set --erase _hydro_" \
        | source
    functions --erase $_hydro_git_info _hydro_{pwd_info,git_info,postexec,fish_exit,uninstall}
end

status is-interactive && _hydro_pwd_info && _hydro_git_info
