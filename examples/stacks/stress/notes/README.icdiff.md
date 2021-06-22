## `icdiff`

> `icdiff` - Show differences between files in a two column view.

Links:
- [project site](https://www.jefftk.com/icdiff)
- [github repo](https://github.com/jeffkaufman/icdiff)

> Wes: And might I add, it's a scrolling diff in the terminal that is color coded and just plain awesome at comparing differences!

```bash
# on macOS, install with: 
brew install icdiff

# built-in docs
icdiff --help
man icdiff

#  (use up to twice)
icdiff \
  --label LABEL_LEFT \
  --label LABEL_RIGHT \
  ...
# sets a virtual filename/label for each side of the diff 
# - as if we had diff'd files with the two labels as names
# - labels show at the top of each diff respectively

# normally you only see what's different 
# along with (configurable) context surrounding the changed lines, usually only one to three lines
# to see the whole file:
icdiff --whole-file

# TIP: zoom out and re-run the diff until there's no wrapping of text to get the best view of what's different.
```

### `process substitution`

```bash 
# process substitution
<(CMD ARGS...) 
```

- alternative: write to file(s), then read the `temporary file(s)` into a subsequent `command` (yuck)
- don't let the term overwhelm you, break down each word:
  - `process` - a `command` we run embedded inside `<()`
  - `substitution` - `substitutes` the `outout` of the `process` (`command`) as `input` to another `command` using an **elegant syntax**!
- how does it work?
  - uses the magic of `temporary files` behind the scenes 
  - hence why I added `--label` args
  - drop the `--label` args and you'll see the `temporary files`!
  - **TLDR**, `process substitution` is just doing what we might manually do by writing to and reading from a `temporary file`!
- FYI, the `temporary files` are discarded upon the receiving `command` completing 
  - which can cause undesirable outcomes if say you launch a program asynchronously 
  - and the launching mechanism completes
  - and the `temporary files` are removed before the secondary program has a chance to read them.
  - this happens with `vscode`'s `diff` mechanism
  - **workaround:** try to get the launcher to `wait` until the secondary program exits to keep the `temporary files` available
- works in most shells, `bash` and `zsh` were tested
- learn more here: https://en.wikipedia.org/wiki/Process_substitution
