module Euler.Problem2 where

-- By considering the terms in the Fibonacci sequence whose values do not exceed
-- four million, find the sum of the even-valued terms.

fibs :: [Integer]
-- Infinite Fibonacci sequence
fibs = 0 : 1 : zipWith (+) fibs (tail fibs)

-- p2solution :: Integral a => a
p2solution = sum (filter even (takeWhile (<= limit) fibs))
             where limit = 4000000
