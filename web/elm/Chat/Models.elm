module Chat.Models exposing (..)

import Types exposing (Message)


type alias Model =
    { newMessage : String
    , topic : String
    , messages : List Message
    }


initialModel : Model
initialModel =
    { newMessage = ""
    , topic = ""
    , messages = []
    }
