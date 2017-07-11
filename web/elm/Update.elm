port module Update exposing (..)

import Phoenix.Socket
import Phoenix.Channel
import Phoenix.Push
import Json.Encode as JE
import Json.Decode as JD exposing (..)
import Json.Decode.Extra as JD exposing (..)
import Messages exposing (Msg(..))
import Models exposing (Model, ChatMessage)
import Routing exposing (parseLocation, navigateTo, Sitemap(..))


port pageView : String -> Cmd msg


changePage : Sitemap -> Cmd msg
changePage page =
    Cmd.batch
        [ navigateTo page
        , pageView (Routing.toString page)
        ]


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        OnLocationChange location ->
            let
                newRoute =
                    parseLocation location
            in
                ( { model | route = newRoute }, Cmd.none )

        OnFetchText (Ok newText) ->
            ( { model | text = newText }, Cmd.none )

        OnFetchText (Err _) ->
            ( model, Cmd.none )

        SetNewMessage string ->
            ( { model | newMessage = string }, Cmd.none )

        SendMessage ->
            let
                payload =
                    (JE.object [ ( "body", JE.string model.newMessage ) ])

                pushMsg =
                    Phoenix.Push.init "new:msg" "room:lobby"
                        |> Phoenix.Push.withPayload payload

                ( phxSocket, phxCmd ) =
                    Phoenix.Socket.push pushMsg model.phxSocket
            in
                ( { model
                    | newMessage = ""
                    , phxSocket = phxSocket
                  }
                , Cmd.map PhoenixMsg phxCmd
                )

        ReceiveChatMessage raw ->
            case JD.decodeValue chatMessageDecoder raw of
                Ok chatMessage ->
                    ( { model | messages = chatMessage :: model.messages }
                    , Cmd.none
                    )

                Err error ->
                    ( model, Cmd.none )

        JoinChannel ->
            let
                channel =
                    Phoenix.Channel.init "room:lobby"

                ( phxSocket, phxCmd ) =
                    Phoenix.Socket.join channel model.phxSocket
            in
                ( { model | phxSocket = phxSocket }
                , Cmd.map PhoenixMsg phxCmd
                )

        PhoenixMsg msg ->
            let
                ( phxSocket, phxCmd ) =
                    Phoenix.Socket.update msg model.phxSocket
            in
                ( { model | phxSocket = phxSocket }
                , Cmd.map PhoenixMsg phxCmd
                )

        ShowHome ->
            ( model, changePage HomeRoute )

        ShowAbout ->
            ( model, changePage AboutRoute )

        Increase amount ->
            ( { model | counter = model.counter + amount }, Cmd.none )

        Decrease amount ->
            ( { model | counter = model.counter - amount }, Cmd.none )


chatMessageDecoder : JD.Decoder ChatMessage
chatMessageDecoder =
    succeed ChatMessage
        |: (oneOf
                [ (field "user" string)
                , succeed "anon"
                ]
           )
        |: (field "body" string)
