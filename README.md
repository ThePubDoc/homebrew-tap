# ThePubDoc Homebrew tap

Homebrew formulae for ThePubDoc projects.

## shellsense

[shellsense](https://github.com/ThePubDoc/shellsense) is an IDE-style autocomplete popup for
the terminal.

```sh
brew install thepubdoc/tap/shellsense
shellsense setup
```

Then open a new terminal. After `brew upgrade shellsense`, run `shellsense stop` once so shells
pick up the new engine.

To remove it:

```sh
shellsense uninstall
brew uninstall shellsense
```
