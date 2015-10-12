module Euler.Problem3 where
-- What is the largest prime factor of the number 600851475143?

import Euler.Utils

largestPrimeFactor = head . reverse . primeFactors

p3solution = largestPrimeFactor 600851475143

