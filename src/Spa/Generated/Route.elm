module Spa.Generated.Route exposing
    ( Route(..)
    , fromUrl
    , toString
    )

import Url exposing (Url)
import Url.Parser as Parser exposing ((</>), Parser)


type Route
    = Contact
    | Counter
    | Home_ { home :  }


fromUrl : Url -> Maybe Route
fromUrl =
    Parser.parse routes


routes : Parser (Route -> a) a
routes =
    Parser.oneOf
        [ Parser.map Contact (Parser.s "contact")
        , Parser.map Counter (Parser.s "counter")
        , (Parser.)
          |> Parser.map (\home -> { home = home })
          |> Parser.map Home_
        ]


toString : Route -> String
toString route =
    let
        segments : List String
        segments =
            case route of
                Contact ->
                    [ "contact" ]
                
                Counter ->
                    [ "counter" ]
                
                Home_ { home } ->
                    [ home ]
    in
    segments
        |> String.join "/"
        |> String.append "/"