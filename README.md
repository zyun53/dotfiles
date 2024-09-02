# dotfiles


## Nix

参考になる

* [Darwin Configuration Options](https://daiderd.com/nix-darwin/manual/index.html)
  * 本家のマニュアル
* [takeokunn/nixos-configuration](https://github.com/takeokunn/nixos-configuration/tree/main)
  * 3つのOSで設定してる方のリポジトリ

```sh
# Bootstrap
nix run nix-darwin -- switch --flake ~/src/github.com/zyun53/dotfiles/nix-darwin

# Update
darwin-rebuild switch --flake ~/src/github.com/zyun53/dotfiles/nix-darwin
```

## TrueColor対応

[TrueColor対応のはなし(端末、シェル、tmux、vim) - Panda Noir](https://www.pandanoir.info/entry/2019/11/02/202146)

```sh
curl -s https://gist.githubusercontent.com/lifepillar/09a44b8cf0f9397465614e622979107f/raw/24-bit-color.sh | bash
```

## macOS

* https://cloud.google.com/sdk/docs/install?hl=ja#mac
* brew install --cask google-cloud-sdk
* brew install kubectl

## app

* [ghq](https://github.com/motemen/ghq)
* [ripgrep](https://github.com/BurntSushi/ripgrep)
* git
* tmux
* zsh
* python3

## vim

[dein](https://github.com/Shougo/dein.vim)

```
curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
# For example, we just use `~/.cache/dein` as installation directory
sh ./installer.sh ~/.cache/dein
```

Vim for PHP: The Complete Guide for a Powerful PHP IDE · Web technologies https://web-techno.net/vim-php-ide/

## zsh

[Zinit](https://github.com/zdharma/zinit)
