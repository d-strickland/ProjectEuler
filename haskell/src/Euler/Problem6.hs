module Euler.Problem6 where

p6solution = (sum [1..100])*(sum [1..100]) - (sum [x*x | x <- [1..100]])

