module Chat.View exposing (..)

import Html exposing (..)
import Html.Attributes exposing (value, placeholder, class)
import Html.Events exposing (onInput, onClick)
import Models exposing (Model)
import Messages exposing (Msg(..))


view : Model -> Html Msg
view model =
    div [ class "chat pv2" ]
        [ div [ class "chat-content" ]
            [ button [ onClick JoinChannel ] [ text "Join Lobby" ]
            , messagesView model.messages
            ]
        , input [ class "chat-input", placeholder "Message...", onInput SetNewMessage, value model.newMessage ] []
        ]


messagesView : List String -> Html Msg
messagesView messages =
    div [ class "messages pv2" ]
        [ text "fake incoming message" ]
