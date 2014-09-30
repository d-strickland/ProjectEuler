module Euler.Problem7 where
-- What is the 10 001st prime number?

import Euler.Utils

-- There was some analysis involved to come up with 130,000 below. pi(n), which
-- represents the number of primes less than or equal to n, can be roughly
-- approximated by n / ln(n). So, if we want to find the 10,001st prime, let
--      pi(n) ~= n / ln(n) = 10,000.
-- Solving numerically for n, we get 116,671 as a ballpark estimate of our
-- target number. Let's generate the primes up to 130,000, just to be safe.

p7solution = (primesTo 130000)!!10000

