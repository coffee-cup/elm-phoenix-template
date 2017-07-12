module Sockets exposing (..)

import Phoenix.Socket
import Messages exposing (Msg(..))


socketServer : String
socketServer =
    "ws://localhost:4000/socket/websocket?username=" ++ "anon"


initPhxSocket : Phoenix.Socket.Socket Msg
initPhxSocket =
    Phoenix.Socket.init socketServer
        |> Phoenix.Socket.withDebug
        |> Phoenix.Socket.on "new:msg" "room:lobby" ReceiveChatMessage
