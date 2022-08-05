module Pages.Counter exposing (Model, Msg, page)

import Gen.Params.Counter exposing (Params)
import Page
import Request
import Shared
import View exposing (View)
import UI

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)

page : Shared.Model -> Request.With Params -> Page.With Model Msg
page _ _ =
    Page.sandbox
        { init = init
        , update = update
        , view = view
        }



-- INIT


-- MODEL = State
type alias Model = Int


init : Model
init = 0



-- UPDATE


-- Msg : reduxで言うところのAction, 状態更新方法の分類
type Msg =
    Inc |
    Dec


-- produce (new state , side effect) from old state and msg
update : Msg -> Model -> ( Model )
update msg model =
    case msg of
        -- add 1 to state
        Inc ->
            model + 1

        -- sub 1 from state
        Dec ->
            model - 1




-- VIEW


view : Model -> View Msg
view model =
    { title = "Counter"
    , body = UI.layout
        [ div []
            [ h3 [] [text "Stateful Page Sample : Counter"]
            , div []
                [ button [onClick Inc] [text "+"]
                , p [class "flow-text"] [ text <| String.fromInt model ]
                , button [onClick Dec] [text "-"]
                ]
            ]
        ]
    }
