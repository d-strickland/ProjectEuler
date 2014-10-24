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

testPrimeFactorization :: Assertion
testPrimeFactorization = [(5,1),(3,1),(2,2)] @=? primeFactorization 60

testPrimesTo1 :: Assertion
testPrimesTo1 = [] @=? primesTo (-9)

testPrimesTo2 :: Assertion
testPrimesTo2 = [2] @=? primesTo 2

testPrimesTo3 :: Assertion
testPrimesTo3 = [2,3] @=? primesTo 3

testPrimesTo4 :: Assertion
testPrimesTo4 = [2,3,5,7,11,13,17,19,23,29,31,37,41,43,47,53,59,61,67,71,73,
                 79,83,89,97,101,103,107,109,113,127,131,137,139,149,151,157,
                 163,167,173,179,181,191,193,197,199,211,223,227,229,233,239,
                 241,251,257,263,269,271,277,281,283,293,307,311,313,317,331,
                 337,347,349,353,359,367,373,379,383,389,397,401,409,419,421,
                 431,433,439,443,449,457,461,463,467,479,487,491,499]
                    @=? primesTo 500

testTriangles :: Assertion
testTriangles = [1,3,6,10,15,21,28,36,45,55,66,78,91,105,120,136,153,171,190,
                 210,231,253,276,300,325,351,378,406]
                    @=? takeWhile (<=406) triangleNumbers

testGeneralPents :: Assertion
testGeneralPents = [1,2,5,7,12,15,22,26,35,40,51,57,70,77,92,100,117,126,145,
                    155,176,187,210,222,247,260,287,301,330,345,376,392,425,442,
                    477,495,532,551,590,610,651,672,715,737,782,805,852,876,925,
                    950,1001,1027,1080,1107,1162,1190,1247,1276,1335]
                        @=? takeWhile (<=1335) generalPents

testPartitions :: Assertion
testPartitions = [1,1,2,3,5,7,11,15,22,30,42,56,77,101,135,176,231,297,385,490,
                  627,792,1002,1255,1575,1958,2436,3010,3718,4565,5604]
                       @=? takeWhile (<=5604) partitions

