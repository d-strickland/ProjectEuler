module Euler.Problem19 where
-- How many Sundays fell on the first of the month during the twentieth century
-- (1 Jan 1901 to 31 Dec 2000)?
import Data.Time.Calendar
import Data.Time.Calendar.WeekDate

p19solution = length $ filter isSunday (map toWeekDate dates)
            where isSunday (y,m,w) = w == 7
                  dates = [fromGregorian y m 1 | y <- [1901..2000], m <- [1..12]]

