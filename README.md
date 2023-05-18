# dotfiles

### Install nix

```sh
$ sh <(curl -L https://nixos.org/nix/install)
```

Reference: https://nixos.org/download.html#nix-install-macos

### Install Home manager

```sh
$ nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
$ nix-channel --update
$ nix-shell '<home-manager>' -A install
```

### Clone the repository

```sh
# Clone it under `/$USER`
$ git clone git@github.com:cychiuae/dotfiles.git
```

```sh
# Create a symlink to config
$ ln -s /$USER/dotfiles/home-manager /$USER/.config/home-manager
```

### Apply the config

```sh
$ home-manager switch
```
