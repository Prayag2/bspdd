<p align="center">
  <h1 align="center">BSPDD</h1>
  <p align="center">BSPWM Dynamic Desktops! A tiny script to make desktops dynamic in BSPWM!</center>
</p>

<p align="center">
<a href="https://github.com/prayag2/bspdd/stargazers"><img alt="GitHub stars" src="https://img.shields.io/github/stars/prayag2/bspdd?color=%233DAEE9&style=for-the-badge"></a>
<a href="https://github.com/prayag2/bspdd/issues"><img alt="GitHub issues" src="https://img.shields.io/github/issues/prayag2/kde_controlcentre?color=%233DAEE9&style=for-the-badge"></a>
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

## TODO
- [ ] Confirm if this script works on dual/triple monitor setups.
- [ ] Add ability to name new desktops dynamically.
