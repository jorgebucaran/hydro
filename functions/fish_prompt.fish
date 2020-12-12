function fish_prompt
    test "$pipestatus" = 0 || set --local color (set_color --bold $fish_color_error)
    echo -n "$_fly_path $color% "(set_color normal)
end

function _fly_on_fish_prompt --on-event fish_prompt
    fish -c '
        set --local branch (
            command git symbolic-ref --short HEAD 2>/dev/null || \
            command git describe --tags --exact-match HEAD 2>/dev/null || \
            command git rev-parse --short HEAD 2>/dev/null
        ) || exit

        echo -n "($branch" 
        ! command git diff --no-ext-diff --quiet --exit-code 2>/dev/null || \
        ! command git diff --no-ext-diff --quiet --exit-code --cached 2>/dev/null && \
            echo -n "*"
        echo -n ") "
    ' &
end   

