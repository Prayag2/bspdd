<p align="center">
  <h1 align="center">⭐ BSPDD ⭐</h1>
  <p align="center">BSPWM Dynamic Desktops! A tiny script to get i3 like dynamic desktops/workspaces in BSPWM!</p>
  <p>Just like in i3wm, this script will create a new workspaces if all the workspaces are occupied and will destroy unoccupied ones automatically. On multi-monitor setups, each monitor will have a different set of workspaces independent of each other.</p>
</p>

<p align="center">
<a href="https://github.com/prayag2/bspdd/stargazers"><img alt="GitHub stars" src="https://img.shields.io/github/stars/prayag2/bspdd?color=%233DAEE9&style=for-the-badge"></a>
<a href="https://github.com/prayag2/bspdd/issues"><img alt="GitHub issues" src="https://img.shields.io/github/issues/prayag2/bspdd?color=%233DAEE9&style=for-the-badge"></a>
</p>


## Installation
- There are no dependencies, except `bspc` (obviously).
- Clone this repository
``` sh
git clone https://github.com/prayag2/bspdd
```
- Move the file to a folder in your `PATH`

## Usage
Add this to your `bspwmrc`
``` sh
pgrep -u $(whoami) -f "bspdd" || bspdd.sh &
```

Help Text
```
Usage: bspdd.sh [options]    
Options:     
	-n <name of new desktop>    
	-m <MONITOR_SEL, see bspc(1) for more info >
```
Here, `-m` can be used to get manage desktops for specific monitors. By default, all monitors are managed by default

## TODO
- [X] Confirm if this script works on dual/triple monitor setups.
- [ ] Add ability to name new desktops dynamically.
