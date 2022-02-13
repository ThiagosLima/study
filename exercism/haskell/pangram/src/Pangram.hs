module Pangram (isPangram) where

import Data.Char (toLower)

isPangram :: String -> Bool
isPangram text = all (`elem` lowerText) alphabet
  where lowerText = map toLower text
        alphabet = ['a'..'z']
