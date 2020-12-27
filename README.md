# Hydro

> Minimal, lag-free prompt with async Git status. Designed for [Fish](https://fishshell.com).

![Hydro](https://user-images.githubusercontent.com/56996/103166797-f807ee00-4868-11eb-9818-c661584274c8.gif)

## Installation

Install with [Fisher](https://github.com/jorgebucaran/fisher):

```console
fisher install jorgebucaran/hydro
```

## Features

One prompt symbol to rule them all. [Change it](#configuration).

<pre>
<b>~</b> ❱ ⎢
</pre>

Show Git branch name and status—prompt repaints asynchronously!

<pre>
~/p/<b>hydro</b> main ❱ touch Solution
~/p/<b>hydro</b> main• ❱ ⎢
</pre>

> `•` indicates that there are staged, unstaged or untracked files.

Show how many commits you're ahead and/or behind of your upstream—prompt repaints asynchronously!

<pre>
~/p/<b>hydro</b> main• ↓2 ❱ git commit -am Hotfix
~/p/<b>hydro</b> main ↑1 ↓2 ❱ git pull --rebase && git push
~/p/<b>hydro</b> main ❱ ⎢
</pre>

Show `$CMD_DURATION` if > `1` second.

<pre>
~/p/<b>hydro</b> main ❱ git push --quiet
~/p/<b>hydro</b> main 1.1s ❱ ⎢
</pre>

Show the last `$pipestatus`.

<pre>
~/p/<b>hydro</b> main ❱ false
~/p/<b>hydro</b> main ❱ [<b>1</b>]
~/p/<b>hydro</b> main ❱ true | false | false
~/p/<b>hydro</b> main [<b>0</b>ǀ<b>1</b>ǀ<b>1</b>] ⎢
</pre>

Truncate `$PWD` segments except for the basename and root of Git repos.

<pre>
<b>~</b> ❱ projects/hydro/
~/p/<b>hydro</b> ❱ functions/share/
~/p/hydro/f/<b>share</b> ❱ ⎢
</pre>

Show current bindings mode.

<pre>
<i>I</i> <b>~</b> ❱ <kbd>Esc</kbd>
<i>N</i> <b>~</b> ❱ <kbd>R</kbd>
<i>R</i> <b>~</b> ❱ ⎢
</pre>

We even set the terminal title to `$PWD` and the currently running command.

```
fish ~/projects/hydro
```

## Performance

Blazing fast would be an understatement, considering that the [LLVM repo](https://github.com/llvm/llvm-project) has over 375,000 commits!

<pre>
~/<b>llvm-project</b> main ❱ time fish_prompt
~/<b>llvm-project</b> main ❱
________________________________________________________
Executed in   79.00 micros    fish           external
   usr time   71.00 micros   71.00 micros    0.00 micros
   sys time    9.00 micros    9.00 micros    0.00 micros
</pre>

## Configuration

Modify variables using `set --universal` from the command line or `set --global` in your `config.fish` file.

### Symbols

| Variable                  | Description                    | Default |
| ------------------------- | ------------------------------ | ------- |
| `hydro_symbol_prompt`     | prompt symbol                  | ❱       |
| `hydro_symbol_git_dirty`  | dirty repository symbol        | •       |
| `hydro_symbol_git_ahead`  | ahead of your upstream symbol  | ↑       |
| `hydro_symbol_git_behind` | behind of your upstream symbol | ↓       |

### Colors

| Variable               | Description                   | Default              |
| ---------------------- | ----------------------------- | -------------------- |
| `hydro_color_pwd`      | color of the pwd segment      | `$fish_color_normal` |
| `hydro_color_git`      | color of the git segment      | `$fish_color_normal` |
| `hydro_color_error`    | color of the error segment    | `$fish_color_error`  |
| `hydro_color_prompt`   | color of the prompt symbol    | `$fish_color_normal` |
| `hydro_color_duration` | color of the duration section | `$fish_color_normal` |

## License

[MIT](LICENSE.md)
