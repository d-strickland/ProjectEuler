module Euler.Problem5 where

import Data.List
-- What is the smallest positive number that is evenly divisible by all of the
-- numbers from 1 to 20?

-- Return the least common multiple of a list of integers.
lcm' = foldl' lcm 1

p5solution = lcm' [1..20]

