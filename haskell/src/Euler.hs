-- This module creates the public API. It simply imports the necessary internal
-- modules and re-exports specific functions.

module Euler (
    p1solution,
    p2solution,
    p3solution,
    p4solution,
    p5solution,
    p6solution,
    p7solution,

    isPrime,
    primeFactors
) where

import Euler.Utils
import Euler.Problem1
import Euler.Problem2
import Euler.Problem3
import Euler.Problem4
import Euler.Problem5
import Euler.Problem6
import Euler.Problem7

