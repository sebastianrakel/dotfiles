#!/usr/bin/env ruby

wm_name = ENV["XDG_SESSION_DESKTOP"]
choice = nil

actions = ['l. Lock', 'h. Suspend', 'r. Reboot', 's. Shutdown', "q. Quit #{wm_name}"]
IO.popen(['rofi', '-p', 'Choose action: ', '-format', 'i', '-dmenu'], 'w+') do |io|
  io.puts(*actions)
  io.close_write
  choice = io.gets
  exit if choice.nil?
end

index = choice.to_i

case index
when 0
  IO.popen(['xscreensaver-command', '--lock'])
when 1
  IO.popen(['systemctl', 'suspend'])
when 2
  IO.popen(['systemctl', 'reboot'])
when 3
  IO.popen(['systemctl', 'poweroff'])
when 4
  case wm_name
  when 'herbstluftwm'
    IO.popen(['herbstclient', 'quit'])
  when 'bspwm'
    IO.popen(['bspc', 'quit'])
  end
end
