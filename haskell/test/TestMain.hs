module Main (
    main
) where

import Test.Tasty
import Test.Tasty.QuickCheck
import Test.Tasty.HUnit

import Euler.UtilsTest
import Euler.P1Test
import Euler.P2Test
import Euler.P3Test
import Euler.P4Test
import Euler.P5Test
import Euler.P11Test
import Euler.P12Test
import Euler.P14Test
import Euler.P18Test

main :: IO ()
main = defaultMain tests

tests :: TestTree
tests =
    testGroup "PE Problems"
    [
        testGroup "Utils"
        [
            testCase "Potential Primes" testRoughPrimes,

            testCase "Primetest 1" testIsPrime1,
            testCase "Primetest 2" testIsPrime2,
            testCase "Primetest 3" testIsPrime3,
            testCase "Primetest 4" testIsPrime4,
            testCase "Primetest 5" testIsPrime5,

            testCase "Primes 1" testPrimes1,
            testCase "Primes 2" testPrimes2,
            testCase "Primes 3" testPrimes3,

            testCase "Prime Factors 1" testPrimeFactors1,
            testCase "Prime Factors 2" testPrimeFactors2,
            testCase "Prime Factors 3" testPrimeFactors3,

            testCase "Prime Factorization" testPrimeFactorization,
            testCase "Triangles" testTriangles,
            testCase "General Pents" testGeneralPents,
            testCase "Partitions" testPartitions
        ],

        testGroup "Problem 1"
        [
            testCase "Sum multiples 1" testSumMultiples1,
            testCase "Sum multiples 2" testSumMultiples2
        ],

        testGroup "Problem 2"
        [
            testCase "Fibonacci Sequence" testFibSequence
        ],

        testGroup "Problem 3"
        [
            testCase "Largest Prime Factor" testLargestPrimeFactor
        ],

        testGroup "Problem 4"
        [
            testCase "Palindrome 1" testIsPalindrome1,
            testCase "Palindrome 2" testIsPalindrome2,
            testCase "Palindrome 3" testIsPalindrome3,
            testCase "Palindrome 4" testIsPalindrome4,
            testCase "Palindrome 5" testIsPalindrome5,

            testCase "Local Max Palindrome" testLocalBest
        ],

        testGroup "Problem 5"
        [
            testCase "LCM" testLcm
        ],

        testGroup "Problem 11"
        [
            testCase "Sublists" testSublists,
            testCase "Sublists too Short" testTooShortList,
            testCase "Left Right Slices" testLeftRight,
            testCase "Up Down Slices" testUpDown
        ],

        testGroup "Problem 12"
        [
            testCase "Divisors 1" testNDivisors1,
            testCase "Divisors 2" testNDivisors2,
            testCase "Divisors 3" testNDivisors3,
            testCase "Divisors 4" testNDivisors4,
            testCase "Divisors 5" testNDivisors5
        ],

        testGroup "Problem 14"
        [
            testCase "Collatz Chain" testCollatzChain,
            testCase "Collatz Length 1" testCollatzLength1,
            testCase "Collatz Length 2" testCollatzLength2,
            testCase "Collatz Length 3" testCollatzLength3,
            testCase "Collatz Length 4" testCollatzLength4
        ],

        testGroup "Problem 18"
        [
            testCase "Accum" testAccum,
            testCase "Max Path" testMaxPath
        ]
    ]

