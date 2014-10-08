module Euler.P11Test where

import Test.HUnit

import Euler.Problem11

testSublists :: Assertion
testSublists = [[8,3,6],[3,6,1],[6,1,4],[1,4,0]] @=? sublists 3 [8,3,6,1,4,0]

testTooShortList :: Assertion
testTooShortList = [] @=? sublists 4 [1,2,3]

testGrid = [[1,2,3],[11,12,13],[21,22,23]]

testLeftRight :: Assertion
testLeftRight = [[1,2],[2,3],[11,12],[12,13],[21,22],[22,23]]
                @=? leftRightSlices 2 testGrid

testUpDown :: Assertion
testUpDown = [[1,11],[11,21],[2,12],[12,22],[3,13],[13,23]]
                @=? upDownSlices 2 testGrid

