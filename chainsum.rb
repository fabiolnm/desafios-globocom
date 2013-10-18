#!/usr/bin/env ruby

# Run with numbers, without commas:
#
# $ ./chainsum.rb 2 -4 6 8 -10 100 -6 5

max = i1 = i2 = -Float::INFINITY
chain = ARGV.map(&:to_i)
n = chain.length

(0..n).each {|i|
  (i..n).each { |j|
    sum = chain[i..j].inject(:+).to_i
    if sum > max
      max, i1, i2 = sum, i, j
      p "#{i1}..#{i2}: #{max}"
    end
  }
}

p "Subchain with max sum: #{i1}..#{i2}: #{max}"
