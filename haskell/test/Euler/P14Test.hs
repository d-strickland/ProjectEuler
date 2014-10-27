module Euler.P14Test where

import Test.HUnit

import Euler.Problem14

testCollatzChain :: Assertion
testCollatzChain = [13,40,20,10,5,16,8,4,2] @=? collatzChain 13

testCollatzLength1 = 10 @=? collatzLengths!!13
testCollatzLength2 = 9  @=? collatzLengths!!40
testCollatzLength3 = 8  @=? collatzLengths!!20
testCollatzLength4 = 7  @=? collatzLengths!!10
