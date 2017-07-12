module Models exposing (..)

import Routing exposing (Sitemap)
import Phoenix.Socket exposing (Socket)
import Sockets exposing (initPhxSocket)
import Messages exposing (Msg(..))
import Chat.Models


type alias Model =
    { counter : Int
    , text : String
    , username : String
    , chatModel : Chat.Models.Model
    , phxSocket : Phoenix.Socket.Socket Msg
    , route : Sitemap
    }


initialModel : Sitemap -> Model
initialModel sitemap =
    { counter = 0
    , text = ""
    , username = ""
    , chatModel = Chat.Models.initialModel
    , phxSocket = initPhxSocket
    , route = sitemap
    }
