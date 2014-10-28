module Euler.Problem20 where
-- Find the sum of the digits in the number 100!
import Data.Digits
import Euler.Utils
p20solution = sum . digits 10 . factorial $ 100
