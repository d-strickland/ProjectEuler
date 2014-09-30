module Euler.P2Test where

import Test.HUnit

import Euler.Problem2

testFibSequence :: Assertion
testFibSequence =
    [0,1,1,2,3,5,8,13,21,34,55,89,144,233,377,610,987,1597,2584,4181]
        @=? take 20 fibs
