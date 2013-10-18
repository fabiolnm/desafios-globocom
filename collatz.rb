#!/usr/bin/env ruby

# Running with
# $ time ./collatz2.rb
# real	0m29.879s
# user	0m29.691s
# sys   0m0.069s

max = [0,0]
(1..1000000).each {|i|
  x = [i]
  x.detect {|v| x << val = (v.even? ? v/2 : 3*v+1) ; val == 1 }
  if (n = x.length) > max[0]
    max = [n,i]
    p max
  end
}
