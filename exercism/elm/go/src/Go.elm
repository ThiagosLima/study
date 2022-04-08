module Go exposing (..)

import GoSupport exposing (..)


applyRules : Game -> Rule -> NonValidatingRule -> Rule -> Rule -> Game
applyRules game oneStonePerPointRule captureRule libertyRule koRule =
    let
        appliedViolationRules =
            game
                |> oneStonePerPointRule
                |> Result.andThen libertyRule
                |> Result.andThen koRule
    in
    case appliedViolationRules of
        Ok validGame ->
            validGame
                |> captureRule
                |> changePlayer

        Err error ->
            { game | error = error }
