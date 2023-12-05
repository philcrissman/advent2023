#!/usr/bin/env ruby

games = File.read("./day2.txt")
  .split("\n")
  .map{|game| game.split(": ").map{|el| el.gsub("Game ", '')}}
  .to_h
  .map{|k,v| [k, v.split("; ").map{|group| group.split(", ")}.map{|list| list.map{|el| el.split(" ").reverse}.to_h }]}
  .to_h

# part 1
puts games.reject { |id,game| 
  game.any?{|h| h["red"].to_i > 12 || h["green"].to_i > 13 || h["blue"].to_i > 14  }
}.keys.map(&:to_i).reduce(:+)

# part 2
puts games.map { |k, v|
  ["red", "green", "blue"].map { |color|
    v.map{|set| set[color]}.map(&:to_i).max.to_i 
  }.reduce(:*)
}.reduce(:+)

