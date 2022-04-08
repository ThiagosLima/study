module TisburyTreasureHunt exposing (..)


type alias TreasureLocation =
    ( Int, Char )


type alias Treasure =
    ( String, ( Int, Char ) )


type alias PlaceLocation =
    ( Char, Int )


type alias Place =
    ( String, ( Char, Int ) )


placeLocationToTreasureLocation : PlaceLocation -> TreasureLocation
placeLocationToTreasureLocation ( col, row ) =
    ( row, col )


treasureLocationMatchesPlaceLocation : PlaceLocation -> TreasureLocation -> Bool
treasureLocationMatchesPlaceLocation placeLocation treasureLocation =
    placeLocationToTreasureLocation placeLocation == treasureLocation


countPlaceTreasures : Place -> List Treasure -> Int
countPlaceTreasures ( _, placeLocation ) treasures =
    treasures
        |> List.map (\( _, treasureLocation ) -> treasureLocation)
        |> List.filter (treasureLocationMatchesPlaceLocation placeLocation)
        |> List.length


specialCaseSwapPossible : ( String, TreasureLocation ) -> ( String, PlaceLocation ) -> ( String, TreasureLocation ) -> Bool
specialCaseSwapPossible ( foundTreasure, _ ) ( place, _ ) ( desiredTreasure, _ ) =
    case ( foundTreasure, place, desiredTreasure ) of
        ( "Brass Spyglass", "Abandoned Lighthouse", _ ) ->
            True

        ( "Amethyst Octopus", "Stormy Breakwater", "Crystal Crab" ) ->
            True

        ( "Amethyst Octopus", "Stormy Breakwater", "Glass Starfish" ) ->
            True

        ( "Vintage Pirate Hat", "Harbor Managers Office", "Model Ship in Large Bottle" ) ->
            True

        ( "Vintage Pirate Hat", "Harbor Managers Office", "Antique Glass Fishnet Float" ) ->
            True

        _ ->
            False
