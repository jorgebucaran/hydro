# Fly

Unobtrusive, minimal, command-line prompt for [Fish](https://fishshell.com) with async Git status.

```shell
~ ❯ fly/
~/fly main* ❯ git add -A && git commit -m Fly
~/fly main ↑1 ❯ git push
~/fly main ❯ false
~/fly main [1] ⎢
```

## Features

- Last `$pipestatus` like `[1]`, `[1|1|0]`, and so on.
- Blazing fast async Git branch and status.
  - `*` indicates you have staged, unstaged, or untracked files.
  - `↑𝘕` indicates `𝘕` commits ahead of your upstream.
  - `↓𝘕` indicates `𝘕` commits behind of your upstream.
- Short `$PWD`—show only what matters.
- Perfect prompt character.
- Sorry, no right prompt.

## Installation

Install with [Fisher](https://github.com/jorgebucaran/fisher):

```console
fisher install jorgebucaran/fly
```

## License

[MIT](LICENSE.md)
