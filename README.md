# Fly.fish

No bells or whistles command-line prompt for [Fish](https://fishshell.com)—it works for me!

```console
~ % fly.fish/
fly.fish % (main*) git add -A && git commit -m Done
fly.fish % (main) ⎢
```

## Features

- Change prompt color on non-zero `$status`.
- Vanishing async git branch and status.
- Show current directory name only.
- No `fish_right_prompt`.

## Installation

Install with [Fisher](https://github.com/jorgebucaran/fisher):

```console
fisher install jorgebucaran/fly.fish
```

## License

[MIT](LICENSE.md)
