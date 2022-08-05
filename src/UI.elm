module UI exposing (layout)

import Html exposing (..)
import Html.Attributes exposing (..)

import Gen.Route as Route exposing (Route)

import Components.Material exposing (..)
import Styles.Attr exposing (flowText)

layout : List (Html msg) -> List (Html msg)
layout children =
  [ div [class "row"]
    [ column 3 [sidebar]
    , column 9 children
    ]
  ]


-- sidebar : Html msg
-- sidebar =
--   div [] 
--   [ div [class "row"] 
--     [ face ]
--   , div [class "row"] 
--     [ listing [] 
--       [ [viewLink "About me" Route.Home_]
--       , [viewLink "Contact" Route.Contact]
--       , [viewLink "Sandbox" Route.Counter]
--       ]
--     ]
--   ]


-- type alias SidebarContents =


sidebar : Html msg
sidebar =
  ul [class "sidenav sidenav-fixed"]
  [ li []
    [ div [class "user-view"]
      [ div [class "background"] []
      , face
      ]
    ]
  , li [] [p [flowText, align "center"] [text "Syouki Tsuyama"]]
  , li [] [div [class "divider"] []]
  , li [] [viewLink "About me" Route.Home_]
  , li [] [viewLink "Contact" Route.Contact]
  , li [] [viewLink "Sandbox" Route.Counter]
  , br [] []
  , li [] [icons]
  ]


face : Html msg
face = 
  div [align "center"]
  [ img 
    [ src "/images/face.png" 
    , class "circle" 
    , style "width" "10em" 
    , style "height" "10em" 
    ] []
  ]

icons : Html msg
icons =
  row
  [ column 1 []
  , column 2 <| [a [href "https://github.com/opfer-10155"] [i [class "small fa-brands fa-github"] []]]
  , column 2 <| [a [href "https://opfer-10155.hatenablog.com/"] [i [class "small fa-solid fa-blog"] []]]
  ]


listing : List (Attribute msg) -> List (List (Html msg)) -> Html msg
listing attrs items =
  ul attrs <|
    List.map (\item -> li [] item) items


viewLink : String -> Route -> Html msg
viewLink label route =
    Html.a [ href (Route.toHref route) ] [ Html.text label ]
