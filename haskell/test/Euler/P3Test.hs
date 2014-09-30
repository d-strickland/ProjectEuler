module Euler.P3Test where

import Test.HUnit

import Euler.Problem3

testLargestPrimeFactor :: Assertion
testLargestPrimeFactor = 3391 @=? largestPrimeFactor 214630577944

