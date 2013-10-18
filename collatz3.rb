#!/usr/bin/env ruby

# Running with
# $ time ./collatz3.rb
# real	0m3.657s
# user	0m3.536s
# sys   0m0.069s

i = 0
cache = {}
max = [0,0]

while (i += 1) <= 1000000 do
  count = 2
  val = i.even? ? i/2 : 3*i+1
  while val != 1
    if cached_count = cache[val]
      count += cached_count - 1
      break
    else
      count += 1
      val = val.even? ? val / 2 : 3*val+1
    end
  end
  cache[i] = count

  if count > max[0]
    max = [count,i]
    p max
  end
end
