port module Subscriptions exposing (..)

import Phoenix.Socket
import Models exposing (Model)
import Messages exposing (Msg(..))


subscriptions : Model -> Sub Msg
subscriptions model =
    Phoenix.Socket.listen model.phxSocket PhoenixMsg
