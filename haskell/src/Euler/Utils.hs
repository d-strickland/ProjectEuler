module Euler.Utils where

import Data.List
import Data.List.Ordered (minus)

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
generalPents = map p (concatMap (\x -> [x, -x]) [1..])
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
-------------------- Prime Number Utilities --------------------
----------------------------------------------------------------
-- All numbers that are not divisible by 2 or 3 up to n.
--
-- All primes, except for 2 and 3, are equal to 6k +/- 1 for some integer k.
-- To prove this, suppose n is not of the form 6k +/- 1. Then one of the
-- following is true:
--      n = 6k                       is divisible by six,
--      n = 6k +/- 2 = 2(3k +/- 1)   is divisible by 2, or
--      n = 6k + 3 = 3(2k + 1)       is divisible by 3.
-- therefore, n is not prime. Note that 6k +/- 1 is not prime for all k (eg: 25)
roughPrimes = 2 : 3 : (concatMap (\k -> [6*k - 1, 6*k + 1]) $ [1..])


-- Generate all primes using the Sieve of Eratosthenes.
primes = 2 : 3 : sieve (drop 2 roughPrimes)
    where sieve (p:xs) = p : sieve (xs `minus` [p*p, p*p + 2*p..])


isPrime :: Integer -> Bool
-- Check if an integer is prime.
isPrime n
    | n  < 2 = False
    | n == 2 = True
    | n == 3 = True
    | otherwise = not (any (`divides` n) (takeWhile (\x->(x*x <= n)) roughPrimes))


primeFactors :: Integer -> [Integer]
-- Return the prime factors of a number, sorted in ascending order
primeFactors = (map fst) . primeFactorization


primeFactorization :: Integer -> [(Integer, Integer)]
-- Return the prime factors of a number sorted in ascending order and their
-- associated powers.
-- Ex: 60 = 2^2 * 3 * 5, so
--     primeFactorization 60 = [(2,2), (3,1), (5,1)]
primeFactorization n
    | n < 2 = []
    | otherwise = reverse $ pFactorization n [] (takeWhile (\x->x*x <= n) roughPrimes)

pFactorization :: Integer -> [(Integer, Integer)] -> [Integer] -> [(Integer,Integer)]
-- Take an integer, a list of known prime factors and their associated powers,
-- and a list of potential prime factors. Complete the list of known prime
-- factors and powers. Sort in ascending order by factor size.
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



----------------------------------------------------------------
------------------------ Misc. Utilities -----------------------
----------------------------------------------------------------

factorial n = foldl' (*) 1 [2..n]

