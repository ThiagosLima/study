module SumOfMultiples (sumOfMultiples) where

sumOfMultiples :: [Integer] -> Integer -> Integer
sumOfMultiples factors limit = sum multiples
  where multiples = [x | x <- [1..limit - 1], any (isMultiple x) factors]
        isMultiple x f = f /= 0 && x `mod` f == 0