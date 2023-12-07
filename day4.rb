#!/usr/bin/env ruby


data =  File.read("./day4.txt").split("\n").map{|line| line.split(":")}.to_h.map{|k,v| [k, v.split(" | ").map(&:lstrip).map{|el| el.split(/\s+/).map(&:to_i
)}]}.to_h

# part 1
puts data.map{|k,v| 2 ** ((v[0] & v[1]).size - 1) }.select{|n| n>=1}.reduce(:+)

# part 2
cards = data.map{|k,v| [(v[0] & v[1]).size, 1] }

cards.map.with_index do |scratchcards, i|
  (1..scratchcards[0]).each do |n|
    break if i+n >= cards.size
    cards[i+n][1] += scratchcards[1]
  end
  
end

puts cards.map{|el| el[1]}.reduce(:+)

