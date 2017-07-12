module Chat.Messages exposing (..)

import Json.Encode as JE


type Msg
    = SetNewMessage String
    | ReceiveMessage JE.Value
    | SendMessage


type OutMsg
    = Say String
