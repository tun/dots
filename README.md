# dots

My personal config files with some magic to setup fresh macos/linux installs.

**Nota:** *This is a WIP of my current environment, please read the source code before run this.*

## Installing

Get the source and cd into the directory:
```
git clone git@github.com:tun/dots.git .dots && cd .dots
```

#### Install dot files:
```
./setup --dots
```

#### Install packages:
```
./setup --packages 
```

_The setup script detects whether is running on macos or linux_.

### Usage
```
./setup.sh [--packages | --dots | --all | --help]
```

## Extra config

Set **git config** `user.name` & `user.email` variables in `~/.extra` file like this:

```
export GIT_USER_NAME="Ricardo Tun"
export GIT_USER_EMAIL="me@capsula.local"
```
