module LuigisLusciousLasagna exposing (remainingTimeInMinutes)


type alias Layers =
    Int


type alias Time =
    Int


remainingTimeInMinutes : Layers -> Time -> Time
remainingTimeInMinutes layers minutesElapsed =
    let
        expectedMinutesInOven =
            40

        minutesPerLayer =
            2

        preparationTimeInMinutes numLayers =
            minutesPerLayer * numLayers
    in
    preparationTimeInMinutes layers + expectedMinutesInOven - minutesElapsed
