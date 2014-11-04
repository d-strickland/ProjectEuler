module Euler.Problem10 where
-- Find the sum of all the primes below two million.
import Euler.Utils

limit = 2000000
p10solution = sum (takeWhile (< limit) primes)
