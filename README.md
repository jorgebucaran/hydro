# Fly.fish

No bells or whistles, minimal prompt for [Fish](https://fishshell.com).

```console
star.fish $ type fish_prompt
fish_prompt is a function with definition
# Defined in /Users/jb/.config/fish/functions/fish_prompt.fish @ line 1
function fish_prompt
    test $status = 0 \
        && echo -en "$_starfish_pwd \$ " \
        || echo -en "$_starfish_pwd \x1b[31m\$\x1b[39m "
end
star.fish $ ..
~ $
```

## Features

- Change prompt color on non-zero `$status`.
- Vanishing async git branch and status.
- Show current directory name.

## Installation

Install with [Fisher](https://github.com/jorgebucaran/fisher):

```console
fisher install jorgebucaran/foobar
```

## License

[MIT](LICENSE.md)
