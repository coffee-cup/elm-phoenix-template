module Messages exposing (..)

import Phoenix.Socket
import Navigation exposing (Location)
import Json.Encode as JE
import Http
import Chat.Messages


type Msg
    = OnLocationChange Location
    | OnFetchText (Result Http.Error String)
    | ChatMsg Chat.Messages.Msg
    | JoinChannel
    | PhoenixMsg (Phoenix.Socket.Msg Msg)
    | ReceiveChatMessage JE.Value
    | ShowHome
    | ShowAbout
    | Increase Int
    | Decrease Int
