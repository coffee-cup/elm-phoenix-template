module Chat.Update exposing (..)

import Json.Encode as JE
import Json.Decode as JD exposing (..)
import Json.Decode.Extra as JD exposing (..)
import Types exposing (Message)
import Chat.Models exposing (Model, initialModel)
import Chat.Messages exposing (Msg(..), OutMsg(..))


update : Msg -> Model -> ( Model, Cmd Msg, Maybe OutMsg )
update msg model =
    case msg of
        SetNewMessage string ->
            ( { model | newMessage = string }
            , Cmd.none
            , Nothing
            )

        SendMessage ->
            ( { model | newMessage = "" }
            , Cmd.none
            , Just <| Say model.newMessage
            )

        ReceiveMessage raw ->
            case JD.decodeValue chatMessageDecoder raw of
                Ok chatMessage ->
                    ( { model | messages = chatMessage :: model.messages }
                    , Cmd.none
                    , Nothing
                    )

                Err error ->
                    ( model
                    , Cmd.none
                    , Nothing
                    )


chatMessageDecoder : JD.Decoder Message
chatMessageDecoder =
    succeed Message
        |: (oneOf
                [ (field "user" string)
                , succeed "anon"
                ]
           )
        |: (field "body" string)


encodeMessage : String -> JE.Value
encodeMessage message =
    (JE.object [ ( "body", JE.string message ) ])
