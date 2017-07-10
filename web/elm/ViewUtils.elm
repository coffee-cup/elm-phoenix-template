module ViewUtils exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)


headingLarge : String -> Html msg
headingLarge title =
    h2 [ class "f-headline-ns f-subheadline-s f1 measure mv4" ] [ text title ]


headingSmall : String -> Html msg
headingSmall title =
    h2 [ class "f2 mv4" ] [ text title ]


heart : Html msg
heart =
    span [ class "text-accent" ] [ text "♥" ]
