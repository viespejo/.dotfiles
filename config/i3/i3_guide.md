# A friendly guide to Vicente's i3 rice (based in Luke's)

Use vim keys (h/j/k/l) to navigate this document. Pressing W will fit it to window width. + and - zoom in and out. f to toggle fullscreen. q to quit, i for Night Mode. (These are general mupdf shortcuts.)

+ Mod+F1 will show this document at any time.
+ By "Mod" I mean the Super Key, usually known as "the Windows Key."

## General

+ Capslock is an alternative escape. Makes vim-craft much more efficient.
+ Super and Alt keys are switched
+ The rice uses the US International keyboard by default. Of course you have the Spanish layout available. Hold both Shift keys to switch layout.

# The Polybar Status Bar

If you're new to i3, notice the status bar on the top and bottom of the screen.

# Shortcut keys

## Window basics

Notice the case sensitivity of the shortcuts.

Be sure you play around with these. Be flexible with the basic commands and the rice will grow on you quick.

+ Mod+Enter -- Spawn terminal
+ Mod+q or Q -- Close window
+ Mod+d -- rofi (For running commands or programs without shortcuts)
+ Mod+t -- Toggle between spawning vertically and horizontally
+ Mod+f or F11 -- Fullscreen
+ Mod+h/j/k/l -- Move to different windows
+ Mod+H/J/K/L -- Move a window around
+ Mod+Y/U/I/O -- Resize windows
+ Mod+/ -- Spawn vertical terminal
+ Mod+' -- Spawn horizonal terminal
+ Mod+s/S -- Increase/decrease inner gaps
+ Mod+z/Z -- Increase/decrease outer gaps
+ Mod+D -- Reduce gaps to 0 pixels
+ Mod+T -- Restore gaps to default (15 pixels)
+ Mod+Shift+Space -- Make a window float (you can still resize and move floating windows with the same keys above)
+ Mod+Space -- Switch from a floating window to a non-floating one (or vice versa)

## Basic Programs

+ Mod+r -- ranger (file browser/manager)
+ Mod+m -- spotify
+ Mod+a -- R calculator (close with Mod+a for reusability)
+ Mod+i -- htop (system info)
+ Mod+y -- calcurse (calendar and schedule)
+ Mod+u or Ctrl+; -- "Dropdown" terminal (close with Mod+u or Ctrl+; for reusability)
+ Mod+Shift+Enter -- new tmux window

## Larger programs

+ Mod+A -- Pavucontrol (audio system control)
+ Mod+w -- Google Chrome
+ Mod+B -- Inkscape
+ Mod+G -- GIMP

## System

+ Mod+R -- Restart/refresh i3 (renews configs, does not close any programs)
+ Mod+x -- i3lock (Enter password to return)
+ Mod+X -- shutdown now (Be careful with this one!)*
+ Mod+Shift+Backspace -- reboot (And this one!)
+ Mod+Shift+Escape -- exit i3 (And this one as well!)
+ Mod+F1 -- Shows this document
+ Mod+F2 -- Recreate dynamic config files - shortcuts (see below)
+ Mod+F3 -- arandr (For adding screens/HDMI/VGA connections)
+ Mod+F4 -- Hibernate
+ Mod+F5 -- Reset Network Manager*
+ Mod+F7 -- Increase window transparency
+ Mod+F8 -- Decrease window transparency
+ Mod+F10 -- Switch to laptop screen
+ Mod+F11 -- Switch to VGA display (if available)
+ Mod+F12 -- Switch to dual VGA/laptop display (if available)

## Audio

+ Mod+m -- spotify
+ Mod+. -- Next track
+ Mod+, -- Previous track
+ Mod+< -- Restart track
+ Mod+p -- Pause
+ Mod+M -- Mute all audio
+ Mod+v -- visualizer
+ Mod+- -- Decrease volume (holding shift increases amount)
+ Mod++ -- Increase volume (holding shift increases amount)
+ Mod+[ -- Back 10 seconds (holding shift increases amount)
+ Mod+] -- Forward 10 seconds (holding shift increases amount)
+ Mod+A -- Pavucontrol (volume control)

## Workspaces

There are ten workspaces. They work just like those in vanilla i3 with some additions.

+ Mod+(Number) -- Go to that number workspace
+ Mod+Shift+(Number) -- Send window to that workspace
+ Mod+Tab -- Go to previous workspace
+ Mod+g or escape -- Go to left workspace
+ Mod+; -- Go to right workspace
+ Mod+Shift+Delete -- "Porno Emergency!" Press this key sequence if you want to hide what you have on your screen. Moves to a totally new workspace, mutes sound, pauses music and brings up distraction windows.

## Recording

I use scrot and ffmpeg to make different recordings of the desktop and audio. All of these recording shortcuts will output into `~/Pictures` or `~/Videos`, and will not overwrite previous recordings.

+ Print Screen -- Take a scrot screenshot
+ Shift+Print Screen -- Take a scrot screenshot of only selected window
+ Ctrl+Shift+Print Screen -- Take a scrot screenshot by selecting a window or rectangle with the mouse.
+ Mod+Insert -- Begin screencast. 
+ Mod+ScrollLock -- Begin audio recording.
+ Mod+Pause -- Begin screen recording without audio.
+ Mod+Print Screen -- Start screenkey
+ Mod+Delete -- kills ffmpeg, thus ending recordings and screen

Each of the recording scripts are located in `~/.dotfiles/scripts/`. You can check them out or modify them if needed.

## Other buttons

I've mapped those extra buttons that some keyboards have (play and pause buttons, email, webbrowsing buttons, etc.) to what you would expect.

# Special traits of my rice

## Easy config access

Open a terminal and type `cfc`. This will open a file where you will see customizable pairs of key shortcuts and config files. Enter any of these shortcuts in zsh or ranger to immediately open the file in vim.

You may add new entries here and they will be refreshed when you refresh i3 (Mod+R) or simply press Mod+F2,

## Folder and config shortcuts

Open a terminal and type `cff`. This opens a file when you can keep and create folder shortcuts. There are only a few here now, because I don't know what your folder structure is going to look like, but on my machine, I have 81 and growing.

Each line has a shortcut key/keys and its target. These can be used in serveral applications. In bash, simply press `d`, the shortcut for `~/Documents` and you will cd there (and automatically `ls -a`).

ranger works similarly. When in ranger, just press `g` then the shortcut of the folder you want to go to. You may also press `t` plus the shortcut to open a new tab there. `m` plus the shortcut moves the selected files to the folder and `Y` copies them there. **Get good at this. It will make management of even the most complex file system easy.**

## Dynamically constructed configs

To keep these different shortcuts in sync, my rice will dynamically reconstruct the shortcuts config file for zsh and ranger each time you refresh i3 (Mod+R) or run the refresh configs script (Mod+F2).

Each time i3 starts or restarts, it will run `~/dotfile/config/scripts/shortcuts`, which reads the entries in the folder shortcut and config shortcut files and then translate them into the approriate syntax of all two programs.

It then takes that output and appends it to shortcuts config file of each program (`~/.config/zsh/.zshortcuts`, `~/.config/ranger/shortcuts.conf`) and puts the output in the proper places for each program.

# Explore and customize

Don't like something about the rice? Change it. If you have a problem, try figuring it out yourself, but if you can't, ask on my YouTube or by my email.

# I thanks Luke for his rice!
[http://lukesmith.xyz](http://lukesmith.xyz)
