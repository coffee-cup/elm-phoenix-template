module Main exposing (..)

import Task
import Navigation exposing (Location)
import Flags exposing (Flags)
import Models exposing (Model, initialModel)
import Messages exposing (Msg(..))
import Subscriptions exposing (subscriptions)
import Commands exposing (getText)
import View exposing (view)
import Update exposing (update, pageView)
import Routing


-- Init


init : Flags -> Location -> ( Model, Cmd Msg )
init flags location =
    let
        currentRoute =
            Routing.parseLocation location
    in
        ( initialModel flags currentRoute
        , Cmd.batch
            [ getText
            , Task.succeed JoinChannel |> Task.perform identity
            ]
        )



-- Main


main : Program Flags Model Msg
main =
    Navigation.programWithFlags OnLocationChange
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }
