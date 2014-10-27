module Euler.Problem16 where
-- What is the sum of the digits of the number 2^1000?
import Data.Digits
p16solution = sum . digits 10 $ 2^1000
