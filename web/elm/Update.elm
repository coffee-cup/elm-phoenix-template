port module Update exposing (..)

import Messages exposing (Msg(..))
import Models exposing (Model)
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

        ShowHome ->
            ( model, changePage HomeRoute )

        ShowAbout ->
            ( model, changePage AboutRoute )

        Increase amount ->
            ( { model | counter = model.counter + amount }, Cmd.none )

        Decrease amount ->
            ( { model | counter = model.counter - amount }, Cmd.none )
