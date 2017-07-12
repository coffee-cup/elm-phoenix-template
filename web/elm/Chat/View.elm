module Chat.View exposing (..)

import Html exposing (..)
import Html.Attributes exposing (value, placeholder, class)
import Html.Events exposing (onInput, onClick, onSubmit)
import Types exposing (Message)
import Chat.Models exposing (Model)
import Chat.Messages exposing (Msg(..))


view : Model -> Html Msg
view model =
    div [ class "chat pv4 sb" ]
        [ viewListMessages model.messages
        , viewMessageInput model.newMessage
        ]


viewListMessages : List Message -> Html Msg
viewListMessages messages =
    div [ class "messages pv2" ]
        (List.map viewMessage (List.reverse messages))


viewMessage : Message -> Html Msg
viewMessage message =
    div [ class "message" ]
        [ span [ class "user text-secondary pr2" ] [ text (message.user) ]
        , span [ class "body" ] [ text message.body ]
        ]


viewMessageInput : String -> Html Msg
viewMessageInput newMessage =
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
