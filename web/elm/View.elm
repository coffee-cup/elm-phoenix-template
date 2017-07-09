module View exposing (..)

import Html exposing (..)
import Html.Attributes exposing (class, href, classList)
import Html.Events exposing (onClick)
import Messages exposing (Msg(..))
import Models exposing (Model)
import Routing exposing (Sitemap(..))
import ViewUtils exposing (..)


view : Model -> Html Msg
view model =
    div [ class "ph6-ns ph4-m ph3" ]
        [ div [ class "full" ] [ page model ]
        , footer
        ]



-- Router


page : Model -> Html Msg
page model =
    case model.route of
        HomeRoute ->
            homeView model

        AboutRoute ->
            aboutView model

        NotFoundRoute ->
            notFoundView


header : Model -> Html Msg
header model =
    div [ class "header bold full vertical-center" ]
        [ div []
            [ h1 [ class "f-headline-ns f-subheadline mv0" ] [ text "Hello." ]
            , counter model.counter
            ]
        ]


counter : Int -> Html Msg
counter counter =
    div [ class "counter f1" ]
        [ span [ onClick (Decrease 1), class "pointer" ] [ text "-" ]
        , span [ class "ph4" ] [ text (toString counter) ]
        , span [ onClick (Increase 1), class "pointer" ] [ text "+" ]
        ]


footer : Html Msg
footer =
    div [ class "footer pb4" ]
        [ p [ class "f5" ]
            [ a [ onClick ShowHome, class "dim none pointer" ] [ text "♥" ]
            ]
        ]



-- Sample Routes


homeView : Model -> Html Msg
homeView model =
    div []
        [ header model
        ]


aboutView : Model -> Html Msg
aboutView model =
    div [ class "about" ]
        [ headingLarge "About"
        , p [ class "measure" ] [ text "About this site." ]
        , a [ onClick ShowHome, class "f1 none dim" ] [ text "←" ]
        ]


notFoundView : Html Msg
notFoundView =
    div [ class "not-found full vertical-center" ]
        [ div []
            [ h2 [ class "f2 mv4 mono" ] [ text "¯\\_(ツ)_/¯" ]
            , p [ class "measure" ]
                [ text "Page not found. "
                , a [ onClick ShowHome, class "pointer su-colour" ] [ text "Go home" ]
                , text "."
                ]
            ]
        ]
