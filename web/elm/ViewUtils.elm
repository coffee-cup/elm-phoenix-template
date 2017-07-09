module ViewUtils exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)


headingLarge : String -> Html msg
headingLarge title =
    h2 [ class "f-headline-ns f-subheadline-m f1 measure mv4" ] [ text title ]


headingSmall : String -> Html msg
headingSmall title =
    h2 [ class "f2 mv4" ] [ text title ]
