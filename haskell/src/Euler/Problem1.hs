module Euler.Problem1 where

-- Find the sum of all the multiples of 3 or 5 below 1000.

summultiples :: (Integral a) => a -> a -> a
-- Find the sum of all multiples of a number m from 0 to some limit n
summultiples m n
    | m <= 0 = 0
    | n <= 0 = 0
    | otherwise = quot ((terms + 1) * terms * m) 2
                  where terms = quot n m

p1solution = (summultiples 3 limit) + (summultiples 5 limit) - (summultiples 15 limit)
             where limit = 999

