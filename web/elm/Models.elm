module Models exposing (..)

import Routing exposing (Sitemap)
import Phoenix.Socket exposing (Socket)
import Messages exposing (Msg(..))


type alias ChatMessage =
    { user : String
    , body : String
    }


type alias Model =
    { counter : Int
    , text : String
    , newMessage : String
    , messages : List ChatMessage
    , phxSocket : Socket Msg
    , route : Sitemap
    }


socketServer : String
socketServer =
    "ws://localhost:4000/socket/websocket"


initPhxSocket : Socket Msg
initPhxSocket =
    Phoenix.Socket.init socketServer
        |> Phoenix.Socket.withDebug
        |> Phoenix.Socket.on "new:msg" "room:lobby" ReceiveChatMessage


initialModel : Sitemap -> Model
initialModel sitemap =
    { counter = 0
    , text = ""
    , newMessage = ""
    , messages = []
    , phxSocket = initPhxSocket
    , route = sitemap
    }
