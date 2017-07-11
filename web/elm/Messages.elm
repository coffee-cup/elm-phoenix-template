module Messages exposing (..)

import Phoenix.Socket
import Json.Encode as JE
import Navigation exposing (Location)
import Http


type Msg
    = OnLocationChange Location
    | OnFetchText (Result Http.Error String)
    | SetNewMessage String
    | SendMessage
    | ReceiveChatMessage JE.Value
    | JoinChannel
    | PhoenixMsg (Phoenix.Socket.Msg Msg)
    | ShowHome
    | ShowAbout
    | Increase Int
    | Decrease Int
