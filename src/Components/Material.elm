module Components.Material exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)

import Debug exposing (toString)

row : List (Html msg) -> Html msg
row = div [class "row"]

column : Int -> List (Html msg) -> Html msg
column size = div [class <| "col s" ++ toString size]

