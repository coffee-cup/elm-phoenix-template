module Sockets exposing (..)

import Phoenix.Socket
import Flags exposing (Flags)
import Messages exposing (Msg(..))


socketServer : String -> String
socketServer websocketUrl =
    websocketUrl ++ "?username=" ++ "anon"


initPhxSocket : Flags -> Phoenix.Socket.Socket Msg
initPhxSocket flags =
    Phoenix.Socket.init (socketServer flags.websocketUrl)
        |> (\socket -> enableDebug flags.prod socket)
        |> Phoenix.Socket.on "new:msg" "room:lobby" ReceiveChatMessage


enableDebug : Bool -> Phoenix.Socket.Socket msg -> Phoenix.Socket.Socket msg
enableDebug prod socket =
    if prod then
        socket
    else
        socket |> Phoenix.Socket.withDebug
