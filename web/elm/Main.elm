module Main exposing (..)

import Navigation exposing (Location)
import Models exposing (Model, initialModel)
import Messages exposing (Msg(..))
import Subscriptions exposing (subscriptions)
import Commands exposing (getText)
import View exposing (view)
import Update exposing (update, pageView)
import Routing


-- Init


init : Location -> ( Model, Cmd Msg )
init location =
    let
        currentRoute =
            Routing.parseLocation location
    in
        ( initialModel currentRoute
        , getText
        )



-- Main


main : Program Never Model Msg
main =
    Navigation.program OnLocationChange
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }
