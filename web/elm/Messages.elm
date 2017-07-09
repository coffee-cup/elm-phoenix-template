module Messages exposing (..)

import Navigation exposing (Location)


type Msg
    = OnLocationChange Location
    | ShowHome
    | ShowAbout
    | Increase Int
    | Decrease Int
