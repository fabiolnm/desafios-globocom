#!/usr/bin/env ruby

# Running with
# $ time ./collatz2.rb
#
# real	0m16.933s
# user	0m16.587s
# sys   0m0.054s

max = [0,0]

i = 0
while (i += 1) <= 1000000 do
  count = 2
  val = i.even? ? i/2 : 3*i+1
  while val != 1
    count += 1
    val = val.even? ? val/2 : 3*val+1
  end

  if count > max[0]
    max = [count,i]
    p max
  end
end
