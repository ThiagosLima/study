module Triangle (TriangleType(..), triangleType) where

data TriangleType = Equilateral
                  | Isosceles
                  | Scalene
                  | Illegal
                  deriving (Eq, Show)

triangleType :: (Num a, Ord a) => a -> a -> a -> TriangleType
triangleType a b c
  | hasZeroSide a b c = Illegal
  | not $ inequality a b c = Illegal
  | allEqualSides a b c = Equilateral
  | twoEqualSides a b c = Isosceles
  | otherwise = Scalene
  where hasZeroSide a b c = a == 0 || b == 0 || c == 0
        inequality a b c = a < b + c && b < a + c && c < a + b
        allEqualSides a b c = a == b && b == c
        twoEqualSides a b c = a == b || b == c || a == c

