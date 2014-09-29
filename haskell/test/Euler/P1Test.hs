module Euler.P1Test where

import Test.HUnit

import Euler.Problem1

testSumMultiples1 :: Assertion
testSumMultiples1 =
    18 @=? summultiples 3 10

testSumMultiples2 :: Assertion
testSumMultiples2 =
    525 @=? summultiples 5 72
