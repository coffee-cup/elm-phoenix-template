module Sockets exposing (..)

import Phoenix.Socket
import Messages exposing (Msg(..))


socketServer : String -> String
socketServer websocketUrl =
    websocketUrl ++ "?username=" ++ "anon"


initPhxSocket : String -> Phoenix.Socket.Socket Msg
initPhxSocket websocketUrl =
    Phoenix.Socket.init (socketServer websocketUrl)
        |> Phoenix.Socket.withDebug
        |> Phoenix.Socket.on "new:msg" "room:lobby" ReceiveChatMessage
