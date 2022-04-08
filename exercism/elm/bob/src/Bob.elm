module Bob exposing (hey)


hey : String -> String
hey remark =
    let
        hasAlphas =
            remark |> String.filter Char.isAlpha |> String.isEmpty |> not

        isQuestion =
            remark |> String.trim |> String.endsWith "?"

        isYelling =
            String.toUpper remark == remark && hasAlphas

        isYellingQuestion =
            isQuestion && isYelling

        isSayingNothing =
            String.trim remark == ""
    in
    if isYellingQuestion then
        "Calm down, I know what I'm doing!"

    else if isQuestion then
        "Sure."

    else if isSayingNothing then
        "Fine. Be that way!"

    else if isYelling then
        "Whoa, chill out!"

    else
        "Whatever."
