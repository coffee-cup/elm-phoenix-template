module Commands exposing (..)

import Http
import Json.Decode as Decode exposing (field)
import Messages exposing (Msg(..))


getText : Cmd Msg
getText =
    Http.get "/api" decodeTextUrl
        |> Http.send OnFetchText


decodeTextUrl : Decode.Decoder String
decodeTextUrl =
    field "hello" Decode.string
