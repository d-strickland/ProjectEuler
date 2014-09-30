module Euler.P5Test where

import Test.HUnit

import Euler.Problem5

testLcm :: Assertion
testLcm = 90 @=? lcm' [6,9,15]

