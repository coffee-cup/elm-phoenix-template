module Routing exposing (..)

import Navigation exposing (Location)
import Route exposing (..)


type Sitemap
    = HomeRoute
    | AboutRoute
    | NotFoundRoute


homeR : Route.Route Sitemap
homeR =
    HomeRoute := static ""


aboutR : Route.Route Sitemap
aboutR =
    AboutRoute := static "about"


sitemap : Route.Router Sitemap
sitemap =
    router [ homeR, aboutR ]


removeTrailingSlash : String -> String
removeTrailingSlash s =
    if (String.endsWith "/" s) && (String.length s > 1) then
        String.dropRight 1 s
    else
        s


match : String -> Sitemap
match s =
    s
        |> removeTrailingSlash
        |> Route.match sitemap
        |> Maybe.withDefault NotFoundRoute


toString : Sitemap -> String
toString r =
    case r of
        HomeRoute ->
            reverse homeR []

        AboutRoute ->
            reverse aboutR []

        NotFoundRoute ->
            "/404"


parseLocation : Location -> Sitemap
parseLocation location =
    match location.pathname


navigateTo : Sitemap -> Cmd msg
navigateTo =
    toString >> Navigation.newUrl
