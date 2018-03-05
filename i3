
set $vga VGA-0
set $lcd LVDS-0

set $mod Mod4
set $alt Mod1

#set $test_net ping -c 3 -W 10 nix.cz > /dev/null

# default decorations
new_window 1pixel

font -*-fixed-medium-r-*-*-18-*-*-*-*-90-iso10646-1

# change focus
bindsym $mod+h focus left
bindsym $mod+j focus down
bindsym $mod+k focus up
bindsym $mod+l focus right

# alternatively, you can use the cursor keys:
# Bindsym $mod+Left focus left
# Bindsym $mod+Down focus down
# Bindsym $mod+Up focus up
# Bindsym $mod+Right focus right

# move focused window
bindsym $mod+Shift+H move left
bindsym $mod+Shift+J move down
bindsym $mod+Shift+K move up
bindsym $mod+Shift+L move right

# alternatively, you can use the cursor keys:
bindsym $mod+Shift+Left move left
bindsym $mod+Shift+Down move down
bindsym $mod+Shift+Up move up
bindsym $mod+Shift+Right move right

# split in horizontal orientation
bindsym $mod+g split h

# split in vertical orientation
bindsym $mod+v split v

# enter fullscreen mode for the focused container
bindsym $mod+f fullscreen

# change layouts
bindsym $mod+s layout stacking
bindsym $mod+w layout tabbed
bindsym $mod+e layout default

# toggle tiling / floating
bindsym $mod+i floating toggle

# lockscreen
bindsym $mod+Escape exec loginctl lock-session

# change focus between tiling / floating windows
bindsym $mod+space focus mode_toggle

# focus the parent container
bindsym $mod+a focus parent

# focus the child container
#bindcode $mod+d focus child

# switch to workspace
bindsym $mod+1 workspace number 1
bindsym $mod+2 workspace number 2
bindsym $mod+3 workspace number 3
bindsym $mod+4 workspace number 4
bindsym $mod+5 workspace number 5
bindsym $mod+6 workspace number 6
bindsym $mod+7 workspace number 7
bindsym $mod+8 workspace number 8
bindsym $mod+9 workspace number 9
bindsym $mod+0 workspace number 10
bindsym $mod+q workspace number 11

# move focused container to workspace
bindsym $mod+Shift+exclam       move workspace number 1
bindsym $mod+Shift+at           move workspace number 2
bindsym $mod+Shift+numbersign   move workspace number 3
bindsym $mod+Shift+dollar       move workspace number 4
bindsym $mod+Shift+percent      move workspace number 5
bindsym $mod+Shift+asciicircum  move workspace number 6
bindsym $mod+Shift+ampersand    move workspace number 7
bindsym $mod+Shift+asterisk     move workspace number 8
bindsym $mod+Shift+parenleft    move workspace number 9
bindsym $mod+Shift+parenright   move workspace number 10

# switch workspace
bindsym $mod+n workspace next
bindsym $mod+p workspace prev
bindsym $mod+b workspace back_and_forth

# reload the configuration file bindsym $mod+Shift+C reload # restart i3 inplace (preserves your layout/session, can be used to upgrade i3) bindsym $mod+Shift+R restart, exec
# exit i3 (logs you out of your X session)
#bindsym $mod+Shift+E exit
#
bindsym $mod+Shift+R restart
bindsym $mod+Shift+x exec dm-tool lock

# resize window (you can also use the mouse for that)
mode "resize" {

# These bindings trigger as soon as you enter the resize mode

# They resize the border in the direction you pressed, e.g.
# when pressing left, the window is resized so that it has
# more space on its left

bindsym h resize shrink left 10 px or 10 ppt
bindsym Shift+h resize grow   left 10 px or 10 ppt

bindsym j resize shrink down 10 px or 10 ppt
bindsym Shift+j resize grow   down 10 px or 10 ppt

bindsym k resize shrink up 10 px or 10 ppt
bindsym Shift+k resize grow   up 10 px or 10 ppt

bindsym l resize shrink right 10 px or 10 ppt
bindsym Shift+l resize grow   right 10 px or 10 ppt

# same bindings, but for the arrow keys
bindsym Left resize shrink left 10 px or 10 ppt
bindsym Shift+Left resize grow   left 10 px or 10 ppt

bindsym Down resize shrink down 10 px or 10 ppt
bindsym Shift+Down resize grow   down 10 px or 10 ppt

bindsym Up resize shrink up 10 px or 10 ppt
bindsym Shift+Up resize grow   up 10 px or 10 ppt

bindsym Right resize shrink right 10 px or 10 ppt
bindsym Shift+Right resize grow   right 10 px or 10 ppt

# back to normal: Enter or Escape
bindsym Return mode "default"
bindsym Escape mode "default"
}

bar {
#status_command i3status | gov_show.sh
 status_command i3status
  verbose yes
  tray_output HDMI-3
}

bindsym $mod+r mode "resize"

bindsym $mod+t mode "focus"

mode "focus" {

    bindsym m mode "default", [class="mplayer2"] focus
    bindsym l mode "default", [class="luakit"] focus
    bindsym i mode "default", [title="irssi"] focus
    bindsym t mode "default", [title="zsh"] focus
    bindsym r mode "default", [title="rtorrent"] focus

    bindsym Escape mode "default"
}

bindsym --release $mod+F5 [title="irssi"] focus, exec xdotool key Alt+q

bindsym $mod+m mode "move"

mode "move" {

bindsym H move left
bindsym J move down
bindsym K move up
bindsym L move right

bindsym Shift+H move left 50 bindsym Shift+J move down 50 bindsym Shift+K move up 50 bindsym Shift+L move right 50

bindsym C move position center
bindsym 0 move position 0 0

bindsym Escape mode "default"
}

bindsym XF86MonBrightnessDown exec xbacklight -dec 5
bindsym XF86MonBrightnessUp exec xbacklight -inc 5

# volume settings
bindsym XF86AudioRaiseVolume exec amixer -q set Master 2dB+ unmute
bindsym XF86AudioLowerVolume exec amixer -q set Master 2dB- unmute

bindsym $mod+F1 exec amixer -q set Master 2dB+ unmute
bindsym $mod+F2 exec amixer -q set Master 2dB- unmute
bindsym $mod+F3 exec amixer -q set Master toggle

bindsym XF86AudioMute exec amixer -q set Master toggle
bindsym XF86AudioMicMute exec amixer -q set Capture toggle

bindsym $mod+XF86AudioLowerVolume exec moax-dmenu unmount
bindsym $mod+XF86AudioRaiseVolume exec moax-dmenu

# music player controls
#bindsym XF86AudioPlay exec mpc -q toggle
#bindsym XF86AudioStop exec mpc -q stop
#bindsym XF86AudioNext exec mpc -q next
#bindsym XF86AudioPrev exec mpc -q prev

# lock and shutdown
bindsym $mod+Shift+End exec sudo pm-suspend

# urxvt tiled and floating
bindsym $mod+Z exec urxvt
bindsym $mod+x exec urxvt
# -name ~~urxvt

# make floating windows floating
for_window [instance="~~*"] floating enable
#for_window [title="mplayer2"] floating enable

for_window [class="love"] floating enable

# open clipboard in the browser (google search)
bindsym $mod+o exec ~/opt/firefox/firefox "www.google.com/search?q=`xclip -o`"

# make a print screen of root and active window
bindsym Print exec screen.sh root
bindsym Mod1+Print exec screen.sh active

# dmenu (a program launcher)
bindsym $mod+d exec i3-dmenu-desktop --dmenu="dmenu -i -l 6 -fn '-*-fixed-medium-r-*-*-18-*-*-*-*-90-iso10646-1' -p 'run>' -nb '#050505' -sb 'darkred' -nf 'gray'"

# governor select (dmenu)
bindsym $mod+c exec sudo cpufreq-set -c0 -r -g `gov_select.sh`

# set default governor
exec sudo cpufreq-set -c0 -r -g ondemand

# kill a window
bindsym $mod+Shift+q kill

# move workspace to outputs
bindsym $mod+Left move workspace to output left
bindsym $mod+Right move workspace to output right

# focusing outputs
#bindsym $mod+XF86Back focus output $lcd
#bindsym $mod+XF86Forward focus output $vga

# show specific scratchpad window and hide the others
#bindsym $mod+F1 [instance="__[^1]"] move scratchpad, [instance="__1"] scratchpad show
#bindsym $mod+F2 [instance="__[^2]"] move scratchpad, [instance="__2"] scratchpad show
#bindsym $mod+F3 [instance="__[^3]"] move scratchpad, [instance="__3"] scratchpad show
#bindsym $mod+F5 [instance="__[^5]"] move scratchpad, [instance="__5"] scratchpad show

bindsym $mod+F4 [instance="__*"] move scratchpad

bindsym $mod+F10 exec show_tree.sh
bindsym $mod+F11 exec dumpyp -c screenshots/last

# move all scratchpad windows to strachpad at first
#for_window [instance="__*"] move to scratchpad, resize grow 100


# exec scratchpad windows
set $scratch_geom 160x50
#exec urxvt -g $scratch_geom -name __2 -e zsh -c "while true; do ncmpc; done"
#exec urxvt -g $scratch_geom -name __1 -e zsh -c "while true; do mutt ; done"
#exec urxvt -g $scratch_geom -name __3 -e zsh -c "while true; do sdcv ; done"
#exec urxvt -g $scratch_geom -name __5 -e zsh -c "while true; do rtorrent ; done"

# basic layout
exec i3-msg 'workspace 1:web; exec /home/z003kbct/opt/firefox/firefox'
exec i3-msg 'workspace 9:mail; exec /home/z003kbct/opt/thunderbird/thunderbird'

workspace 1:web output DP-2
workspace 9:mail output eDP-1

exec nm-applet

# assign applications to workspaces
#assign [class="Dwb"] 1:web
#assign [title="irssi*"] 2:im
#assign [instance="download"] 11:down

#assign [class="rdesktop"] 9

bindsym $mod+Shift+F10 border 1pixel
bindsym $mod+Shift+F11 border none
bindsym $mod+Shift+o border normal

for_window [class="GV"] floating enable
for_window [class="Gnuplot"] floating enable, move to center

#client.background #050505

for_window [title="radar-sh"] floating enable, move position 10px 10px

# make sure the correct resolution is always set (some apps may break it then restarting i3 helps)
#exec_always xrandr -s 1680x1050
#floating_minimum_size 1200 x 800

bindsym $mod+Shift+n exec i3-input -f '-*-fixed-medium-r-*-*-18-*-*-*-*-90-iso10646-1' -F 'rename workspace to "%s"' -P 'rename workspace: '

# exec at startup

# set locking (screensaver) timeout to 2 minutes
exec xset s 120 120
exec xss-lock -- i3lock -t -i ~/.wallpaper

# setup keyboard
exec xmodmap ~/.xmodmap

# setup display order
exec xrandr --output HDMI-3 --left-of eDP-1 && xrandr --output DP-2 --left-of HDMI-3 && feh --bg-fill .wallpaper