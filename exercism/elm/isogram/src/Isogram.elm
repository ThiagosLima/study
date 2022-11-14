module Isogram exposing (isIsogram)

import Set


isIsogram : String -> Bool
isIsogram sentence =
    let
        validChars =
            sentence
                |> String.toLower
                |> String.filter Char.isAlpha

        isogramChars =
            validChars
                |> String.toList
                |> Set.fromList
    in
    String.length validChars == Set.size isogramChars
