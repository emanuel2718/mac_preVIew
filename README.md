<h1 align="center" style="font-size: 3rem;">
mac_preVIew
</h1>

VIM-like navigation while reading PDF's on macOS Preview app. No need to prefix
VIM commands with `Ctrl` or `Shift`, just open the Preview app and start navigating
comfortably through PDF's. Keybinds are only available when Preview is in focus (i.e beign used).

## Preview of preVIew:
![Alt Text](https://media.giphy.com/media/f67PtLjfiRjDBaoVqS/giphy.gif)



### Step 1: Install Hammerspoon:

##### Manual Installation:
 * Download the [latest release](https://github.com/Hammerspoon/hammerspoon/releases/latest)
 * Drag `Hammerspoon.app` from your `Downloads` folder to `Applications`

##### Homebrew installation:
  * `brew cask install hammerspoon`

### Step 2: Install mac_preVIew:
On a Terminal window:

1. `git clone https://github.com/emanuel2718/mac_preVIew.git`

2. `mkdir ~/.hammerspoon`

3. `ln -s <path-to-mac_preVIew-folder>/init.lua ~/.hammerspoon/init.lua`

### Step 3: Reaload Hammerspoon configuration:
Open Hammerspoon application either with a Spotlight search or by Right
clicking Hammerspoon application in Finder and selecting `Open`.
Then, press `Shift + Cmd + R` to reaload Hammerspoon configuration.
At this point VIM keybinds should be enabled while using Preview.

TLDR: `Open` Hammerspoon appllication and press `Shift + Cmd + R`.

# How to use:
In order for the VIM navigation keybinds to work; *Preview* app must be
**opened** and in **focus**. 

### Different PDF Reader:
If you want to use a PDF reader other than Preview:

Open `init.lua` in your editor of choice and change the value of the `READER`
variable to the exact name (case sensitive) of the PDF Reader of your choice.

For example: `README = 'Adobe Acrobat Reader DC'`

### Navigation:
 * `h` : Scroll Left
 * `j` : Scroll Down
 * `k` : Scroll Up
 * `l` : Scroll Right
 * `i` : Enter Insert Mode



 * `ESC` : Enter Normal Mode
 * `g`   : Scroll Top of PDF
 * `SHIFT+g` : Scroll Bottom of PDF
 * `CTRL+f` : Scroll to next page
 * `CTRL+b` : Scroll to previous page

### TODO LIST:
- [x] Create documentation on how to install
- [x] Insert and Normal mode.
- [x] Add gg, G vim navigation commands (Go to bottom and top of pdf)
- [x] CTRL+f, CTRL+b (Scroll to the next page or the previous)
- [ ] Add SHIFT+`key` to scroll faster than normal scrolling speed.
- [ ] Disable all hotkeys when spotlight is beign used.
- [ ] Add a list of application that the vim like commands will be used?
- [ ] Refactor code (Maybe use hs.modal for Normal and Insert modes)

### Credits:
This project couldn't have been possible without [Hammerspoon](https://github.com/Hammerspoon/hammerspoon), which is a powerful OSX automation tool.

Visit their [Website](http://www.hammerspoon.org/) for more imformation.
