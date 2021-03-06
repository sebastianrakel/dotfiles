#!/usr/bin/env ruby
require 'socket'

def start_conquer(index)
  socket = "/run/user/1000/conquer.#{index}.socket"
  log = "conquer.#{index}.log"
  bundle = '/home/sebastian/.gem/ruby/2.3.0/bin/bundle'
  font = '-*-fixed-medium-*-*-*-10-*-*-*-*-*-*-*'
  command = "#{bundle} exec conquer -s #{socket} bar.rb #{width} #{index} 2> #{log} | dzen2 -ta l -x #{x} -y #{y} -w #{width} -h 16 -fn #{font}"

  return command
end

def start_polybar(index)
  hostname = Socket.gethostname
  command = "polybar -r -c ~/.config/polybar/config #{hostname}"
  return command
end
monitor_count = `herbstclient list_monitors`.lines.size
poly_displays = `polybar -m`.lines

main_x = 0
main_y = 0
main_width = 0

bar_pids = monitor_count.times.map do |index|
  x, y, width = `herbstclient monitor_rect "#{index}"`.split(' ')

  if index == 0
    width = width.to_i - 80
    main_x = x.to_i
    main_y = y.to_i
    main_width = width.to_i
  end

  monitor = poly_displays[index].split(":")[0]
  
  command = start_polybar(index)
  pad_command = "herbstclient pad #{index} 0 0 50 0"
  p pad_command
  p command
  Process.spawn(pad_command)
  
  Process.spawn({"MONITOR" => monitor}, command)
end

sleep 1
trayer_pid = 0

IO.popen(%w(herbstclient --idle)) do |io|
  io.each do |line|
    next unless line.chomp == 'reload'

    bar_pids.each { |pid|
      Process.kill('TERM', pid)
    }

    Process.kill('TERM', trayer_pid) unless trayer_pid == 0
    exit(0)
  end
end
