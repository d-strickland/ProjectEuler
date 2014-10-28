module Euler.P18Test where

import Test.HUnit

import Euler.Problem18

testAccum = [11,31,20,19] @=? accum [6,3,18,9,12] [5,13,2,7]

testMaxPath = 23 @=? maxPath [[3],[7,4],[2,4,6],[8,5,9,3]]

