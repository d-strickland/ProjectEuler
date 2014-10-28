module Euler.Utils where

import Data.List
import Data.List.Ordered hiding (merge)

----------------------------------------------------------------
----------------------- Useful Sequences -----------------------
----------------------------------------------------------------
figurateNumbers n = scanl1 (+) [1,n-1..]

triangleNumbers = figurateNumbers 3
squareNumbers = figurateNumbers 4
pentagonalNumbers = figurateNumbers 5

-- A list of generalized pentagonal numbers
-- The closed form solution for pentagonalNumbers = [p1, p2, ..., pn, ...]
-- is 
--          pn = (3n^2 - n) / 2
-- generalizing this to n = 1,-1,2,-2,3,-3,4... seems arbitrary, but it has
-- some applications to number theory.
generalPents = map p (merge [1,2..] [-1,-2..])
             where p n = (3*n*n - n) `quot` 2


-- A list of values of the partition function.
-- partitions!!n = the number of ways to wite n as a sum of positive integers.
-- So, partitions!!5 = 7, as
--      5 = 5 = 4+1 = 3+2 = 3+1+1 = 2+2+1 = 2+1+1+1 = 1+1+1+1+1
-- Our good buddy Euler proved that the partition function is related to the
-- general pentagonal numbers in the following way:
-- p(k) = p(k-1) + p(k-2) - p(k-5) - p(k-7) + p(k-12) + p(k-15) - p(k-22) - ...
-- where 1,2,5,7,12,... are the generalized pentagonal numbers.
--      p(0) := 1 and p(n) := 0 for negative n.
partitions = map p [0..]
    where p n | n <  0    = 0
              | n == 0    = 1
              | otherwise = sum (zipWith (*) (cycle [1,1,-1,-1]) ps)
                    where ps = [partitions!!(n-m) | m <- takeWhile (<=n) generalPents]

----------------------------------------------------------------
-------------------- Prime Number Functions --------------------
----------------------------------------------------------------
roughPrimes :: Integer -> [Integer]
-- Return all numbers that are not divisible by 2 or 3 up to n.
--
-- All primes, except for 2 and 3, are of the form 6k +/- 1.
-- To prove this, suppose n is not of the form 6k +/- 1. Then
--      n = 6k                       is divisible by six and is not prime,
--      n = 6k +/- 2 = 2(3k +/- 1)   is divisible by 2, or
--      n = 6k + 3 = 3(2k + 1)       is divisible by 3.
roughPrimes n
    | n  < 2    = []
    | n == 2    = [2]
    | otherwise = 2 : 3 : (merge [5,11..n] [7,13..n])

--Rough primes up to sqrt(n)
sqrtRPrimes = roughPrimes . floor . sqrt . fromIntegral


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
primeFactors = (map fst) . primeFactorization


primeFactorization :: Integer -> [(Integer, Integer)]
-- Return the prime factors of a number sorted in descending order and their
-- associated powers.
-- Ex: 60 = 5 * 3 * 2^2, so
--     primeFactorization 60 = [(5,1), (3,1), (2,2)]
primeFactorization n
    | n < 2 = []
    | otherwise = pFactorization n [] (sqrtRPrimes n)

pFactorization :: Integer -> [(Integer, Integer)] -> [Integer] -> [(Integer,Integer)]
-- Take an integer, a list of known prime factors and their associated powers,
-- and a list of potential prime factors. Complete the list of known prime
-- factors and powers. Sort in descending order by factor size.
pFactorization 1 factors _ = factors
pFactorization n known [] = (n,1):known
pFactorization n [] (p:potential)
    | p `divides` n = pFactorization (n `quot` p) [(p,1)] potential
    | otherwise     = pFactorization n [] potential
pFactorization n ((k,pow):known) (p:potential)
    | k `divides` n = pFactorization (n `quot` k) ((k,pow+1):known) (p:potential)
    | p `divides` n = pFactorization (n `quot` p) ((p,1):(k,pow):known) potential
    | otherwise     = pFactorization n ((k,pow):known) potential


divides m n = (n `rem` m) == 0


-- Generate primes up to n using the Sieve of Eratosthenes.
primesTo n
    | n < 2     = []
    | n == 2    = [2]
-- We already culled numbers divisible by 2 and 3, so take those out and add
-- them back to the start.
    | otherwise = 2 : 3 : sieve (tail (tail (roughPrimes n)))
    where sieve (p:xs)
            | p*p > n   = p:xs
            | otherwise = p : sieve (xs `minus` [p*p, p*p + 2*p..])

factorial n = foldl' (*) 1 [2..n]

