set --global _fly_git_status _fly_git_status_$fish_pid

function fish_prompt
    set --local _status $pipestatus
    test (math +$_status) = 0 \
        && set --local prompt % \
        || set --local prompt "$_fly_color_error"[(string join "|" $_status)]

    echo -n "$_fly_color_reset$_fly_pwdinfo $$_fly_git_status$_fly_color_reset$prompt "

    set --query _fly_init && set --erase _fly_init && _fly_fish_prompt && _fly_set_pwdinfo
end

function _fly_set_pwdinfo --on-variable PWD
    set --query fish_prompt_pwd_dir_length || set --local fish_prompt_pwd_dir_length 1
    set --global _fly_pwdinfo (
        string replace ~ \~ $PWD | \
        string replace --all --regex -- "(\.?[^/]{$fish_prompt_pwd_dir_length})[^/]*/" \$1/
    )
end

function _fly_git_status --on-variable $_fly_git_status
    commandline --function repaint
end

function _fly_fish_prompt --on-event fish_prompt
    fish --command "    
        if set --local branch (
            command git symbolic-ref --short HEAD 2>/dev/null || \
            command git describe --tags --exact-match HEAD 2>/dev/null || \
            command git rev-parse --short HEAD 2>/dev/null
        )
            count (command git ls-files --others --exclude-standard) >/dev/null ||
            ! command git diff --no-ext-diff --quiet --exit-code 2>/dev/null || \
            ! command git diff --no-ext-diff --quiet --exit-code --cached 2>/dev/null && \
                set --universal $_fly_git_status \"(\$branch$_fly_color_error*$_fly_color_reset) \" || \
                set --universal $_fly_git_status \"(\$branch) \"
        else
            set $_fly_git_status
        end
    " &
end   

function _fly_fish_exit --on-event fish_exit
    set --erase $_fly_git_status
end