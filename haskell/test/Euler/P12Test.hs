module Euler.P12Test where

import Test.HUnit

import Euler.Problem12

testNDivisors1 :: Assertion
testNDivisors1 = 6 @=? numberDivisors 28

testNDivisors2 :: Assertion
testNDivisors2 = 12 @=? numberDivisors 60

testNDivisors3 :: Assertion
testNDivisors3 = 10 @=? numberDivisors 80

testNDivisors4 :: Assertion
testNDivisors4 = 12 @=? numberDivisors 96

testNDivisors5 :: Assertion
testNDivisors5 = 8 @=? numberDivisors 104

