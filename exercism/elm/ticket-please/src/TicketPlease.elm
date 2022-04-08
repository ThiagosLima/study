module TicketPlease exposing (..)

import TicketPleaseSupport exposing (Status(..), Ticket(..), User(..))


emptyComment : ( User, String ) -> Bool
emptyComment ( _, comment ) =
    comment == ""


numberOfCreatorComments : Ticket -> Int
numberOfCreatorComments (Ticket ticket) =
    let
        { createdBy, comments } =
            ticket

        ( creator, _ ) =
            createdBy
    in
    comments
        |> List.filter (\( user, _ ) -> user == creator)
        |> List.length


assignedToDevTeam : Ticket -> Bool
assignedToDevTeam (Ticket { assignedTo }) =
    case assignedTo of
        Just (User "Alice") ->
            True

        Just (User "Bob") ->
            True

        Just (User "Charlie") ->
            True

        _ ->
            False


assignTicketTo : User -> Ticket -> Ticket
assignTicketTo user (Ticket ({ status } as ticket)) =
    Ticket
        (case status of
            Archived ->
                ticket

            New ->
                { ticket | assignedTo = Just user, status = InProgress }

            _ ->
                { ticket | assignedTo = Just user }
        )
