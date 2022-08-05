-- moved from "default"

-- With elm-spa, you can choose any Elm view library you like.
-- Whether it's elm/html, Elm UI, or even your own custom library,
-- the View module has you covered!
module View exposing (View, map, none, placeholder, toBrowserDocument)

import Browser
import Html exposing (Html)

type alias View msg =
    { title : String
    , body : List (Html msg)
    }

placeholder : String -> View msg
placeholder str =
    { title = str
    , body = [ Html.text str ]
    }


-- basic value for View
none : View msg
none =
    placeholder ""


map : (a -> b) -> View a -> View b
map fn view =
    { title = view.title
    , body = List.map (Html.map fn) view.body
    }

toBrowserDocument : View msg -> Browser.Document msg
toBrowserDocument view =
    { title = view.title
    , body = view.body
    }

------------------
-- If you wanted to use Elm UI ...
-- import Element exposing (Element)
-- type alias View msg =
--     { title : String
--     , element : Element msg
--     }

-- For Elm UI
-- none : View msg
-- none =
--     { title = ""
--     , element = Element.none
--     }

-- example with Elm UI
-- map : (a -> b) -> View a -> View b
-- map fn view =
--     { title = view.title
--     , element = Element.map fn view.element
--     }

-- example for Elm UI
-- toBrowserDocument : View msg -> Browser.Document msg
-- toBrowserDocument view =
--     { title = view.title
--     , body =
--         [ Element.layout [] view.element
--         ]
--     }
------------------

