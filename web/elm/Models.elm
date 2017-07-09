module Models exposing (..)

import Routing exposing (Sitemap)


type alias Model =
    { counter : Int
    , route : Sitemap
    }


initialModel : Sitemap -> Model
initialModel sitemap =
    { counter = 0
    , route = sitemap
    }
