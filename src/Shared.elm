module Shared exposing
    ( Flags
    , Model
    , Msg
    , init
    , subscriptions
    , update
    )

-- moved from "default"

import Json.Decode as Json
import Request exposing (Request)


-- The first thing you'll see is a Flags type
-- exposed from the top of the file. 
-- If we need to load some initial data from Javascript
-- when our Elm app starts up,
-- we can pass that data in as flags.

-- When you have the need to send in initial JSON data, 
-- take a look at Elm's official guide on JS interop.

type alias Flags =
    Json.Value


type alias Model =
    {}


type Msg
    = NoOp


-- The init function is called when your application loads for the first time.
-- It takes in two inputs:
    -- Flags - initial JS values passed in on startup.
    -- Request - the Request value with current URL information.
init : Request -> Flags -> ( Model, Cmd Msg )
init _ _ =
    ( {}, Cmd.none )


-- The update function allows you to respond
-- when one of your pages or this module send a Shared.Msg.
update : Request -> Msg -> Model -> ( Model, Cmd Msg )
update _ msg model =
    case msg of
        NoOp ->
            ( model, Cmd.none )

-- If you want all pages to listen for
-- keyboard events, window resizing, or other external updates,
-- this subscriptions function is a great place to wire those up!
subscriptions : Request -> Model -> Sub Msg
subscriptions _ _ =
    Sub.none
