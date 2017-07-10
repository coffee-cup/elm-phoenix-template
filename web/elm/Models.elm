module Models exposing (..)

import Routing exposing (Sitemap)


type alias Model =
    { counter : Int
    , text : String
    , newMessage : String
    , messages : List String
    , route : Sitemap
    }


initialModel : Sitemap -> Model
initialModel sitemap =
    { counter = 0
    , text = ""
    , newMessage = ""
    , messages = []
    , route = sitemap
    }
