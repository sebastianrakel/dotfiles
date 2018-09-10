#!/usr/bin/env ruby

@backlight_tool = 'xbacklight'

def backlight_decrease(percentage)
  `#{@backlight_tool} -#{percentage}`
end

def backlight_increase(percentage)
  `#{@backlight_tool} +#{percentage}`
end

def backlight_current
  `#{@backlight_tool}`.to_f
end

if ARGV.count != 1 then
  puts "no argument provided"
  exit(1)
end

backlicht_command = ARGV[0]

step_percentage = 10
current = backlight_current() 
if current < 20.0 then
  step_percentage = 3
end

case backlicht_command
when "decrease"
  puts "Decrease #{current} to #{current - step_percentage}"
  backlight_decrease(step_percentage)
when "increase"
  puts "Increase #{current} to #{current + step_percentage}"
  backlight_increase(step_percentage)
else
  puts "unknown command"
  exit(1)
end

exit(0)
