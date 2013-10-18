#!/usr/bin/env ruby

# Run with numbers, without commas:
#
# $ ./robot.rb my_robot_filename.txt
#
# PS: my_robot_filename must be a valid file - this program
# does not handle invalid commands

HEADINGS = %w{N E S W}

File.open(ARGV[0]) do |f|
  width, height = f.readline.split(" ").map(&:to_i)
  x, y, h = f.readline.split " "
  x, y = [x, y].map(&:to_i)
  heading = HEADINGS.index h

  p "Starting at #{x}, #{y}, #{h}"

  f.each do |line|
    if line[0] == 'T'
      *, tx, ty = line.split(" ").map(&:to_i)
      if tx.between?(0, width) and ty.between?(0, height)
        x, y = [tx, ty]
        p "Teletransported to #{x}, #{y}, #{HEADINGS[heading]}"
      end
    else
      line.chomp.chars.each do |command|
        case command
        when 'L'
          heading -= 1
        when 'R'
          heading += 1
        when 'M'
          case HEADINGS[heading]
          when 'N'
            y += 1 if y + 1 <= height
          when 'S'
            y -= 1 if y - 1 > 0
          when 'E'
            x += 1 if x + 1 <= width
          when 'W'
            x -= 1 if x - 1 > 0
          end
        end
        p "#{command}: #{x} #{y} #{HEADINGS[heading]}"
      end
    end
  end
  p "Position: #{x} #{y} #{HEADINGS[heading]}"
end
