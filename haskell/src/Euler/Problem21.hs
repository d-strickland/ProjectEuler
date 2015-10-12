module Euler.Problem21 where
-- Let d(n) be defined as the sum of proper divisors of n (numbers less than n
-- which divide evenly into n).
-- If d(a) = b and d(b) = a, where a ≠ b, then a and b are an amicable pair and
-- each of a and b are called amicable numbers.
-- 
-- Evaluate the sum of all the amicable numbers under 10000.
import Euler.Utils

-- First, we need a quick way to find d(n). There are a few tricks we can use here.
-- Let σ(n) be the sum of all divisors of n (including n).
-- Consider d(p*q) where p and q are relatively prime. Then
--          d(p*q) = d(p) * d(q)

