module Euler.Problem14 where
-- The following iterative sequence is defined for the set of positive integers:
--     n → n/2 (n is even)
--     n → 3n + 1 (n is odd)
-- Which starting number, under one million, produces the longest chain?
-- NOTE: Once the chain starts the terms are allowed to go above one million.
import Euler.Utils
import Data.Ord
import Data.List

limit = 1000000

-- Note to self: Although the code is quite succinct, this brute-force solution
-- took more than the standard 60 seconds. The collatzLengths list was an attempt
-- to improve performance, but it actually seems to be worse, probably because
-- of the O(n) (!!) operation. I may be overlooking something awesome, but this
-- problem seems more suited to a mutable data structure. TODO: try rewriting
-- this using mutable vectors. With a mutable vector, a bottom-up approach might
-- be the way to go, rather than the top-down one below.

p14solution = fst $ maximumBy (comparing snd) [(n, length . collatzChain $ n) | n <- [1..limit]]

collatz n | even n    = n `quot` 2
          | otherwise = 3*n + 1

collatzChain = takeWhile (/= 1) . iterate collatz

-- The Collatz chain is not defined for n < 1, but add a -1 for index 0 to
-- simplify the index arithmetic.
collatzLengths = -1 : map (c 1) [1..limit]
    where c len n | n == 1        = len
                  | otherwise     = c (len+1) next
                  | next <= limit = (collatzLengths!!next) + 1
                    -- Don't cache lengths for terms higher than the limit or
                    -- this will blow up!
                  | next >  limit = c (len+1) next
                  where next = collatz n

-- p14solution = fst $ maximumBy (comparing snd) (zip [0..limit] collatzLengths)

