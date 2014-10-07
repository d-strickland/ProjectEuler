module Euler.Problem9 where
-- A Pythagorean triplet is a set of three natural numbers, a < b < c, for which,
--                       a^2 + b^2 = c^2
-- For example, 3^2 + 4^2 = 9 + 16 = 25 = 5^2.
--
-- There exists exactly one Pythagorean triplet for which a + b + c = 1000.
-- Find the product abc.

limit = 1000

pairs = concat [[(a, b) | b <- [a+1..lim]] | a <- [1..lim-1]]
        where lim = limit `quot` 2
triples = [(a, b, limit-a-b) | (a, b) <- pairs]

specialTriple = (head . (filter fltr)) triples
                where fltr (a,b,c) = a*a + b*b == c*c

p9solution = (\(a,b,c) -> a*b*c) specialTriple

