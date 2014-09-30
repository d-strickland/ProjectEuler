module Euler.Problem4 where
-- Find the largest palindrome made from the product of two 3-digit numbers.

import Data.Digits

isPalindrome :: Integer -> Bool
isPalindrome n = digs == reverse digs
                 where digs = digits 10 n

localMaxPalindrome :: Integer -> Integer
-- Take a max factor and find the largest palindrome that can be made by
-- multiplying it with another number
localMaxPalindrome n = if palindromes == [] then 0 else head palindromes
                       where palindromes = filter isPalindrome candidates
                             candidates = [n*m | m <- [n,n-1..1]]

p4solution = maximum [localMaxPalindrome n | n <- [999,998..100]]

