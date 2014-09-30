module Euler.UtilsTest where

import Test.HUnit

import Euler.Utils

testMerge1 :: Assertion
testMerge1 = [3,4,5,6,7,8] @=? merge [3,5,7] [4,6,8]

testMerge2 :: Assertion
testMerge2 = [1,2,3,4,5] @=? merge [] [1,2,3,4,5]

testMerge3 :: Assertion
testMerge3 = [1,2,3,4,5] @=? merge [1,2,3,4,5] []

testMerge4 :: Assertion
testMerge4 = [1,5,2,3,4] @=? merge [1,2,3,4] [5]

testRoughPrimes :: Assertion
testRoughPrimes = [2,3,5,7,11,13,17,19,23,25] @=? roughPrimes 25

testIsPrime1 :: Assertion
testIsPrime1 = False @=? isPrime (-7)

testIsPrime2 :: Assertion
testIsPrime2 = False @=? isPrime 0

testIsPrime3 :: Assertion
testIsPrime3 = False @=? isPrime 1 

testIsPrime4 :: Assertion
testIsPrime4 = False @=? isPrime 289

testIsPrime5 :: Assertion
testIsPrime5 = True @=? isPrime 141650963

testPrimeFactors1 :: Assertion
testPrimeFactors1 = [7] @=? primeFactors 7

testPrimeFactors2 :: Assertion
testPrimeFactors2 = [17] @=? primeFactors 4913

testPrimeFactors3 :: Assertion
testPrimeFactors3 = [3571,2851,2] @=? primeFactors 58051611542

