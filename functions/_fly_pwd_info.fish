function _fly_pwd_info --on-variable PWD
    set --query fish_prompt_pwd_dir_length || set --local fish_prompt_pwd_dir_length 1
    set --global _fly_pwd_info (
        string replace --ignore-case -- ~ \~ $PWD | \
        string replace --all --regex -- "(\.?[^/]{$fish_prompt_pwd_dir_length})[^/]*/" \$1/
    )
end
