set $mod Mod4
set $alt Mod1

# default decorations
new_window 1pixel

# default font for i3
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
    status_command i3status
    verbose yes
    tray_output primary
}

bindsym $mod+r mode "resize"
bindsym $mod+t mode "focus"

mode "focus" {

    bindsym w mode "default", [class="Firefox"] focus
    bindsym i mode "default", [title="irssi"] focus
    bindsym t mode "default", [title="zsh"] focus

    bindsym Escape mode "default"
}


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

bindsym XF86AudioMute exec amixer -q set Master toggle
bindsym XF86AudioMicMute exec amixer -q set Capture toggle

bindsym $mod+XF86AudioLowerVolume exec moax-dmenu unmount
bindsym $mod+XF86AudioRaiseVolume exec moax-dmenu

# lock and shutdown
bindsym $mod+Shift+End exec sudo pm-suspend

# urxvt tiled and floating
bindsym $mod+Z exec urxvt
bindsym $mod+x exec urxvt

# make floating windows floating
for_window [title="mail_handle"] floating enable

# open clipboard in the browser (google search)
bindsym $mod+o exec /opt/firefox/firefox "http://www.google.com/search?q=`xclip -o`"

# dmenu (a program launcher)
bindsym $mod+d exec i3-dmenu-desktop --dmenu="dmenu -i -l 6 -fn '-*-fixed-medium-r-*-*-18-*-*-*-*-90-iso10646-1' -p 'run>' -nb '#050505' -sb 'darkred' -nf 'gray'"

# kill a window
bindsym $mod+Shift+q kill

# move workspace to outputs
bindsym $mod+Left move workspace to output left
bindsym $mod+Right move workspace to output right

# basic layout
exec i3-msg 'workspace 1:web; exec /home/z003kbct/opt/firefox/firefox'
exec i3-msg 'workspace 9:mail; exec /home/z003kbct/opt/thunderbird/thunderbird'

workspace 1:web output DP-2
workspace 9:mail output eDP-1

exec nm-applet

bindsym $mod+Shift+F10 border 1pixel
bindsym $mod+Shift+o border normal

for_window [class="GV"] floating enable
for_window [class="Gnuplot"] floating enable, move to center

bindsym $mod+Shift+n exec i3-input -f '-*-fixed-medium-r-*-*-18-*-*-*-*-90-iso10646-1' -F 'rename workspace to "%s"' -P 'rename workspace: '

# exec at startup
# set locking (screensaver) timeout to 2 minutes
exec xset s 120 120
exec xss-lock -- i3lock -t -i ~/.wallpaper

# setup keyboard
exec xmodmap ~/.xmodmap

# setup display order
exec xrandr --output DP2 --left-of eDP1 && xrandr --output DP3 --left-of DP2 && feh --bg-fill .wallpaper

exec blueman-applet
exec pasystray

# Spotify binding and settings
bindsym $mod+u [con_mark="music"] border normal, scratchpad show, resize set 1800 px 1000 px, move position center, border normal
for_window [class="Spotify"] mark "music", move scratchpad

bindsym Print exec scrshot.sh

bindsym $mod+F1 exec seat.sh
bindsym $mod+F3 exec amixer set Master 5%-
bindsym $mod+F4 exec amixer set Master 5%+

bindsym $mod+F5 exec "dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.PlayPause"
bindsym $mod+F6 exec "dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Previous"
bindsym $mod+F7 exec "dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Next"

bindsym $mod+F9 exec xbacklight -dec 10
bindsym $mod+F10 exec xbacklight -inc 10
bindsym $mod+F11 exec xrandr --output DP2 --left-of eDP1 --auto --output DP3 --left-of DP2 --auto
bindsym $mod+F12 exec xrandr --output DP3 --off --output DP2 --off

exec spotify
