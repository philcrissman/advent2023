#!/usr/bin/env ruby

data = File.read("./day3.txt").split("\n")

part_numbers = []

class Gear
  @@all_gears = Array.new

  class << self
    def find_by(x, y)
      @@all_gears.select{|g| g.x == x && g.y == y }.first
    end

    def find_or_create_with(x, y)
      gear = Gear.find_by(x, y)
      if !gear.nil?
        return gear
      else
        return Gear.new(x, y)
      end
    end

    def all_gears
      @@all_gears
    end
  end

  attr_accessor :x, :y, :nums

  def initialize(x,y)
    @x = x
    @y = y
    @nums = []
    @@all_gears << self
  end

  def valid?
    nums.size > 1
  end

  def ratio
    nums.reduce(:*)
  end
end

data.each_with_index do |line, y|
  line.scan(/\d+/) do |number|
    offset = Regexp.last_match.offset(0).first
    range = (offset-1..offset+number.size)
    symbol_adjacent = false
    (y-1..y+1).each do |ly|
      next if ly < 0
      next if ly > data.size-1
      range.each do |lx|
        next if line[lx].nil?
        current_char = data[ly][lx]
        if (current_char != '.' && !current_char.match(/\d/))
          symbol_adjacent = true
          if current_char == "*"
            g = Gear.find_or_create_with(lx,ly)
            g.nums << number.to_i
          end
        end
      end
      if (symbol_adjacent)
        part_numbers << number.to_i
        break
      end
    end
  end
end

# part 1
puts part_numbers.reduce(:+)

# part 2

puts Gear.all_gears.select(&:valid?).map{|g| g.ratio }.reduce(:+)

