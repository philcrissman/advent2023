#!/usr/bin/env ruby


input = File.read("./day1.txt").split("\n")
input2 = input.map do |line|
  {'one'=>'o1e','two'=>'t2o','three'=>'t3e','four'=>'f4r','five'=>'f5e','six'=>'s6x','seven'=>'s7n','eight'=>'e8t','nine'=>'n9e'}.each do |k,v|
    line=line.gsub(k,v)
  end
  line
end
puts input != input2
puts input2.map{|el| el.split('').reject{|n| n =~ /\D/}.values_at(0,-1).join.to_i }.reduce(:+)
