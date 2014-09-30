module Euler.P4Test where

import Test.HUnit

import Euler.Problem4

testIsPalindrome1 :: Assertion
testIsPalindrome1 = True @=? isPalindrome 12133121

testIsPalindrome2 :: Assertion
testIsPalindrome2 = True @=? isPalindrome 987656789

testIsPalindrome3 :: Assertion
testIsPalindrome3 = True @=? isPalindrome 5

testIsPalindrome4 :: Assertion
testIsPalindrome4 = False @=? isPalindrome 12345678

testIsPalindrome5 :: Assertion
testIsPalindrome5 = False @=? isPalindrome 23232323

testLocalBest :: Assertion
testLocalBest = 9009 @=? localMaxPalindrome 99

