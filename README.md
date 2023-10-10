# Tmux panes as Tabs

This plugin will allow you manage panes easier, as if they were tabs.

## Functioning

By using the Plugin Prefix Key (Alt + A by default) you can switch the focus on the pane by just pressing a number

For instance Alt + A + 3 , will switch the current active pane to pane no 3. Alt + 0 wil make you go to pane number 0.

(Additionaly pane no 10 is on Plugin Prefix + - , pane no 11 on Plugin Prefix + q , pane no 12 on Plugin Prefix + w etc...)

Plugin Prefix + ,       : Goto Previous Pane
Plugin Prefix + .       : Goto Next Pane

The plugin has a *fullscreen* mode, enabled by default, this ensures that the panes display on FullScreen while switching in between them, behaving pretty much like tabs.

Note that when using fullscreen mode you will loose the ability to use panes as splits of windows.

By default it will make the Status Bar get 2 lines height, so the Second Line will show the current pane focused upon the rest of existing panes for that window.

You can change a pane name by just Plugin Prefix + c


We used to call them panes, call them tabs now!!.


## Plugin Customization

Add the following directives on your `.tmux.conf` file, if you want to to change the following:

For changing the default Plugin Prefix Key do

```
set -g @panes_as_tabs_prefix 'M-g'
```

For change the default Pane As Tabs Fullscreen Mode to not full screen

```
set -g @panes_as_tabs_fullscreen_default 'nofull'
```


## New features to add on new versions

- Dvorak and other keyboard layout support for qwerty (11 -12 -13 ...) Pane numbers
- Upon fullscreen toggle zoom in all Tabs in Session (make it as a custom option)
- Synchronise focused pane no in between 2 windows (create a hook for that)
