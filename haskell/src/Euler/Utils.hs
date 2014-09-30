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
    | otherwise = not (any (`divides` n) (sqrtRPrimes n))


primeFactors :: Integer -> [Integer]
-- Return the prime factors of a number, sorted in descending order
primeFactors n
    | n < 2 = []
    | otherwise = pFactors n [] (sqrtRPrimes n)

pFactors :: Integer -> [Integer] -> [Integer] -> [Integer]
-- Take an integer, a list of known prime factors, and a list of potential prime
-- factors. Complete the list of known prime factors
pFactors 1 factors _ = factors
pFactors n known [] = n:known
pFactors n [] (p:potential)
    | p `divides` n = pFactors (n `quot` p) [p] potential
    | otherwise     = pFactors n [] potential
pFactors n (k:known) (p:potential)
    | k `divides` n = pFactors (n `quot` k) (k:known) (p:potential)
    | p `divides` n = pFactors (n `quot` p) (p:k:known) potential
    | otherwise     = pFactors n (k:known) potential


divides m n = (n `rem` m) == 0

--Rough primes up to sqrt(n)
sqrtRPrimes = roughPrimes . floor . sqrt . fromIntegral

