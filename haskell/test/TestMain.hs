module Main (
    main
) where

import Test.Tasty
import Test.Tasty.QuickCheck
import Test.Tasty.HUnit

import Euler.P1Test

main :: IO ()
main = defaultMain tests

tests :: TestTree
tests =
    testGroup "PE Problems"
    [
        testGroup "Problem 1"
        [
            testCase "Sum multiples 1" testSumMultiples1,
            testCase "Sum multiples 2" testSumMultiples2
        ]
    ]
