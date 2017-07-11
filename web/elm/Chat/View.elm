module Chat.View exposing (..)

import Html exposing (..)
import Html.Attributes exposing (value, placeholder, class)
import Html.Events exposing (onInput, onClick, onSubmit)
import Models exposing (Model, ChatMessage)
import Messages exposing (Msg(..))


view : Model -> Html Msg
view model =
    div [ class "chat pv2" ]
        [ div [ class "chat-content" ]
            [ button [ onClick JoinChannel ] [ text "Join Lobby" ]
            , viewListMessages model.messages
            ]
        , inputForm model.newMessage
        ]


viewListMessages : List ChatMessage -> Html Msg
viewListMessages messages =
    div [ class "messages pv2" ]
        (List.map viewMessage (List.reverse messages))


viewMessage : ChatMessage -> Html Msg
viewMessage message =
    div [ class "message" ]
        [ span [ class "user" ] [ text (message.user ++ ": ") ]
        , span [ class "body" ] [ text message.body ]
        ]


inputForm : String -> Html Msg
inputForm newMessage =
    div [ class "chat-input" ]
        [ form [ onSubmit SendMessage ]
            [ input
                [ placeholder "Message..."
                , onInput SetNewMessage
                , value newMessage
                ]
                []
            ]
        ]
