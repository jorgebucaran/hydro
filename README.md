# Fly.fish

Unobtrusive, minimal command-line prompt for [Fish](https://fishshell.com) that flies~%!

```console
~ % fly.fish/
fly.fish (main*) % git add -A && git commit -m Done
fly.fish (main) % false
fly.fish (main) ! ⎢
```

## Features

- Change prompt color on non-zero `$status`.
- Short path—show only what matters.
- Async git branch and quick status.
- No `fish_right_prompt`.

## Installation

Install with [Fisher](https://github.com/jorgebucaran/fisher):

```console
fisher install jorgebucaran/fly.fish
```

## License

[MIT](LICENSE.md)
