module Euler.Problem12 where
-- Let us list the factors of the first seven triangle numbers:
-- 
--     1: 1
--     3: 1,3
--     6: 1,2,3,6
--     10: 1,2,5,10
--     15: 1,3,5,15
--     21: 1,3,7,21
--     28: 1,2,4,7,14,28
-- 
-- We can see that 28 is the first triangle number to have over five divisors.
-- 
-- What is the value of the first triangle number to have over five hundred divisors?
import Euler.Utils

limit = 500

-- First, find the prime factorization of a number: n = p^a * q^b * r^c * ...
-- Then the number of divisors is (a+1)(b+1)(c+1)...
numberDivisors = product . map (\(p,a) -> a+1) . primeFactorization

divisorPairs = zip triangleNumbers (map numberDivisors triangleNumbers)

p12solution = fst ((head . filter (\(n,d) -> d > limit)) divisorPairs)

