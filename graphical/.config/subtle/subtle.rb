# -*- encoding: utf-8 -*-
#
require "socket"
host = Socket.gethostname


set :increase_step, 5
set :border_snap, 10
set :default_gravity, :center
set :urgent_dialogs, false
set :honor_size_hints, false
set :gravity_tiling, false
set :click_to_focus, false
set :skip_pointer_warp, false
set :skip_urgent_warp, false
set :wmname, "LG3D"


for i in 1..3
  screen i do
    top    [ :views, :spacer, :title, :spacer, :keychain, :spacer, :tray, :clock]
    bottom [ :cpu, :memory, :spacer, :ipaddr, :battery, :wifi]                
  end                         
end

style :all do
  background  "#202020"
  icon        "#757575"
  border      "#303030", 0
  padding     0, 3
  font        "-*-*-*-*-*-*-14-*-*-*-*-*-*-*"
  #font        "xft:sans-8"
end

style :views do
  foreground  "#757575"
  # Style for the active views
  style :focus do
    foreground  "#fecf35"
    border_bottom "#fecf35", 3 
  end

  # Style for urgent window titles and views
  style :urgent do
    foreground  "#ff9800"
  end

  # Style for occupied views (views with clients)
  style :occupied do
    foreground  "#b8b8b8"
  end
end

style :sublets do
  foreground  "#757575"
end

style :separator do
  foreground  "#757575"
  separator   "|"
end

style :title do
  foreground  "#fecf35"
end

style :clients do
  active    "#303030", 2
  inactive  "#202020", 2
  margin    0
  width     50
end

style :subtle do
  margin      0, 0, 0, 0
  panel       "#202020"
  # background  "#3d3d3d"
  stipple     "#757575"
end

# Gravities

gravity :top_left,       [   0,   0,  50,  50 ]
gravity :top_left66,     [   0,   0,  50,  66 ]
gravity :top_left33,     [   0,   0,  50,  34 ]

gravity :top,            [   0,   0, 100,  50 ]
gravity :top66,          [   0,   0, 100,  66 ]
gravity :top33,          [   0,   0, 100,  34 ]

gravity :top_right,      [  50,   0,  50,  50 ]
gravity :top_right66,    [  50,   0,  50,  66 ]
gravity :top_right33,    [  50,   0,  50,  33 ]
gravity :top_right_wide66, [  33,  0,  67,  67 ]
gravity :top_right_small33,    [  67,   0,  33,  50 ]
gravity :top_right_very_small33,    [  67,   0,  33,  33 ]

gravity :left,           [   0,   0,  50, 100 ]
gravity :left66,         [   0,   0,  66, 100 ]
gravity :left33,         [   0,   0,  33, 100 ]

gravity :center,         [   0,   0, 100, 100 ]
gravity :center66,       [  17,  17,  66,  66 ]
gravity :center33,       [  33,  33,  33,  33 ]

gravity :right,          [  50,   0,  50, 100 ]
gravity :right66,        [  34,   0,  66, 100 ]
gravity :right33,        [  67,   0,  33, 100 ]
gravity :right_small33,        [  67,   33,  33, 34 ]

gravity :bottom_left,    [   0,  50,  50,  50 ]
gravity :bottom_left66,  [   0,  34,  50,  66 ]
gravity :bottom_left33,  [   0,  67,  50,  33 ]

gravity :bottom,         [   0,  50, 100,  50 ]
gravity :bottom66,       [   0,  34, 100,  66 ]
gravity :bottom33,       [   0,  67, 100,  33 ]

gravity :bottom_right,   [  50,  50,  50,  50 ]
gravity :bottom_right66, [  50,  34,  50,  66 ]
gravity :bottom_right33, [  50,  67,  50,  33 ]
gravity :bottom_right_small33, [  67,  50,  33,  50 ]
gravity :bottom_right_very_small33, [  67,  67,  33,  33 ]
gravity :bottom_right_wide_small33, [  33,  67,  67,  33 ]

gravity :gimp_image,     [  10,   0,  80, 100 ]
gravity :gimp_toolbox,   [   0,   0,  10, 100 ]
gravity :gimp_dock,      [  90,   0,  10, 100 ]

# Keybinding
# Subtle Commands

grab "W-S-1", :ViewJump1
grab "W-S-2", :ViewJump2
grab "W-S-3", :ViewJump3
grab "W-S-4", :ViewJump4

grab "W-1", :ViewSwitch1
grab "W-2", :ViewSwitch2
grab "W-3", :ViewSwitch3
grab "W-4", :ViewSwitch4

grab "KP_Add",      :ViewNext
grab "KP_Subtract", :ViewPrev

grab "W-A-1", :ScreenJump1
grab "W-A-2", :ScreenJump2
grab "W-A-3", :ScreenJump3
grab "W-A-4", :ScreenJump4


grab "W-C-r", :SubtleReload
grab "W-C-S-r", :SubtleRestart
grab "W-C-q", :SubtleQuit


grab "W-B1", :WindowMove


grab "W-B3", :WindowResize


grab "W-f", :WindowFloat
grab "W-space", :WindowFull
grab "W-S-s", :WindowStick
grab "W-equal", :WindowZaphod


grab "W-r", :WindowRaise
grab "W-l", :WindowLower


grab "W-Left",  :WindowLeft
grab "W-Down",  :WindowDown
grab "W-Up",    :WindowUp
grab "W-Right", :WindowRight
grab "W-S-q", :WindowKill

# Gravities

grab "W-q", [ :top_left,     :top_left66,     :top_left33     ]
grab "W-w", [ :top,          :top66,          :top33          ]
grab "W-e", [ :top_right,    :top_right66,    :top_right33, :top_right_small33, :top_right_very_small33, :top_right_wide66 ]
grab "W-a", [ :left,         :left66,         :left33         ]
grab "W-s", [ :center,       :center66,       :center33       ]
grab "W-d", [ :right,        :right66,        :right33,     :right_small33        ]
grab "W-x", [ :bottom,       :bottom66,       :bottom33       ]
grab "W-c", [ :bottom_right, :bottom_right66, :bottom_right33, :bottom_right_small33, :bottom_right_very_small33, :bottom_right_wide_small33 ]

if (host == "snotra")
  grab "W-z", [ :bottom_left,  :bottom_left66,  :bottom_left33  ]
else
  grab "W-y", [ :bottom_left,  :bottom_left66,  :bottom_left33  ]
end

# Programs

grab "W-Return", "termite"
grab "W-F2", "rofi -show run"

grab "Print", "teiler"
grab "W-S-Print", "teiler --togglecast"
grab "A-Print", "teiler --quick area"
grab "W-Print", "teiler --quick fullscreen"

grab "W-F3", "~/.bin/rofi-extension/rofi-extension.sh subtle_change_view"
grab "W-S-e", "~/.bin/rofi-extension/rofi-extension.sh powercontrol"

if (host == "WSL-RakelSebast")
  grab "W-S-l", "xscreensaver-command --lock"
else
  grab "W-S-l", "i3lock"
end

grab "XF86AudioRaiseVolume",  "amixer -D pulse sset Master 5%+"
grab "XF86AudioLowerVolume", "amixer -D pulse sset Master 5%-"
grab "XF86AudioMute", "amixer -D pulse set Master Playback Switch toggle"


grab "S-F2" do |c|
  puts c.name
end

grab "S-F3" do
  puts Subtlext::VERSION
end

# Tags

tag "terms" do
  match "xterm|[u]?rxvt|termite"
  gravity :center
end

tag "browser" do
  match "uzbl|opera|firefox|navigator|chromium|Google-chrome*"
  gravity :center
end

tag "messenger" do
  match "telegram|pidgin|ts3client_linux_amd64"
  gravity :center
end

tag "remote" do
  match "rdesktop|remmina"
  gravity :center
  float false
end

tag "editor" do
  match  "[g]?vim|atom|sublime"
  gravity :center
end

tag "development" do
  match "robomongo|code|MonoDevelop|flamerobin|jetbrains-*"
  gravity :center
end

tag "filemanager" do
  match "thunar|spacefm|pcmanfm"
  gravity :center
end

tag "virtual" do
  match "virt-manager"
  gravity :center
end

tag "games" do
  match "steam"
  gravity :center
end

tag "media" do
  match "spotify"
end

tag "stick" do
  match "mplayer"
  float true
  stick true
end

tag "dialog" do
  match "sun-awt-X11-XDialogPeer"
  float true
  borderless false
  type :dialog
end


tag "gimp_image" do
  match   :role => "gimp-image-window"
  gravity :gimp_image
end

tag "gimp_toolbox" do
  match   :role => "gimp-toolbox$"
  gravity :gimp_toolbox
end

tag "gimp_dock" do
  match   :role => "gimp-dock"
  gravity :gimp_dock
end

tag "gimp_scum" do
  match role: "gimp-.*|screenshot"
end

# Views

view "terms" do
  match "terms|default"
  icon "~/.config/subtle/icons/terminal.xbm"
  icon_only true
end

view "www" do
  match "browser|messenger"
  icon "~/.config/subtle/icons/world.xbm"
  icon_only true
end

view "dev" do
  match "editor|development"
  icon "~/.config/subtle/icons/bug.xbm"
  icon_only true
end

view "media" do
  match "media"
  icon "~/.config/subtle/icons/headphones.xbm"
  icon_only true
end

view "virt" do
  match "virtual|remote"
  icon "~/.config/subtle/icons/screen.xbm"
  icon_only true
end

view "stuff" do
  match "filemanager"
  icon "~/.config/subtle/icons/file1.xbm"
  icon_only true
end  

view "games" do
  match "games"
  icon "~/.config/subtle/icons/pacman.xbm"
  icon_only true
end  

# Sublets

if(host == "snotra")
  sublet :wifi do
      device "wlp2s0"
      interval 10
  end

  sublet :battery do
      colors 10 => "#ff0000", 30 => "#fff000"
  end
end

sublet :memory do
end

sublet :cpu do
end

sublet :clock do
  interval      1
  format_string "%a, %d.%m.%Y | %H:%M:%S" 
end 













































