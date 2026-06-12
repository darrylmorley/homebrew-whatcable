# homebrew-whatcable

Homebrew tap for [WhatCable](https://github.com/darrylmorley/whatcable), the macOS menu bar app for USB-C cable diagnostics.

## Install

```sh
brew install --cask darrylmorley/whatcable/whatcable
```

For the CLI only (no menu bar app):

```sh
brew install darrylmorley/whatcable/whatcable-cli
```

Homebrew 6 may warn about untrusted third-party taps on first install. If an existing install starts complaining about an untrusted tap, run `brew trust darrylmorley/whatcable` or see https://docs.brew.sh/Tap-Trust for details.

## Update

```sh
brew upgrade --cask whatcable
```

## Uninstall

```sh
brew uninstall --cask whatcable
```

Use `brew uninstall --zap --cask whatcable` to also remove preferences and application support files.

## Requirements

macOS 14 (Sonoma) or later.
