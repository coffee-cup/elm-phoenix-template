module Messages exposing (..)

import Navigation exposing (Location)
import Http


type Msg
    = OnLocationChange Location
    | OnFetchText (Result Http.Error String)
    | ShowHome
    | ShowAbout
    | Increase Int
    | Decrease Int
