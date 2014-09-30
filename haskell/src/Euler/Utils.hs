module Euler.Utils where

roughPrimes :: Integer -> [Integer]
-- All primes, except for 2 and 3, are of the form 6k +/- 1.
-- To prove this, suppose n is not of the form 6k +/- 1. Then
--      n = 6k                       is divisible by six and is not prime,
--      n = 6k +/- 2 = 2(3k +/- 1)   is divisible by 2, or
--      n = 6k + 3 = 3(2k + 1)       is divisible by 3.
--
-- This function will use this method to return all potential primes up to n.
roughPrimes n
    | n  < 2    = []
    | n == 2    = [2]
    | otherwise = 2 : 3 : (merge [5,11..n] [7,13..n])


merge :: [a] -> [a] -> [a]
-- Merge two lists, taking from alternating lists.
merge [] ys = ys
merge xs [] = xs
merge (x:xs) (y:ys) = x : y : merge xs ys


isPrime :: Integer -> Bool
-- Check if an integer is prime.
isPrime n
    | n  < 2 = False
    | n == 2 = True
    | n == 3 = True
    | otherwise = not (any (divideN) rPrimes)
                  where rPrimes = (roughPrimes . floor . sqrt . fromIntegral) n
                        divideN m = (n `rem` m) == 0

