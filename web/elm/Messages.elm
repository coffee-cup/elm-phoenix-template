module Messages exposing (..)

import Navigation exposing (Location)
import Http


type Msg
    = OnLocationChange Location
    | OnFetchText (Result Http.Error String)
    | SetNewMessage String
    | JoinChannel
    | ShowHome
    | ShowAbout
    | Increase Int
    | Decrease Int
