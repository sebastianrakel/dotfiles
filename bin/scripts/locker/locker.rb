#!/usr/bin/env ruby

choice = nil

actions = ['l. Lock', 'h. Suspend', 'r. Reboot', 's. Shutdown', 'q. Quit HLWM']
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
  IO.popen(['herbstclient', 'quit'])
end
