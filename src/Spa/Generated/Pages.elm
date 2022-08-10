module Spa.Generated.Pages exposing
    ( Model
    , Msg
    , init
    , load
    , save
    , subscriptions
    , update
    , view
    )

import Pages.Contact
import Pages.Counter
import Pages.Home_
import Shared
import Spa.Document as Document exposing (Document)
import Spa.Generated.Route as Route exposing (Route)
import Spa.Page exposing (Page)
import Spa.Url as Url


-- TYPES


type Model
    = Contact__Model Pages.Contact.Model
    | Counter__Model Pages.Counter.Model
    | Home___Model Pages.Home_.Model


type Msg
    = Contact__Msg Pages.Contact.Msg
    | Counter__Msg Pages.Counter.Msg
    | Home___Msg Pages.Home_.Msg



-- INIT


init : Route -> Shared.Model -> ( Model, Cmd Msg )
init route =
    case route of
        Route.Contact ->
            pages.contact.init ()
        
        Route.Counter ->
            pages.counter.init ()
        
        Route.Home_ params ->
            pages.home_.init params



-- UPDATE


update : Msg -> Model -> ( Model, Cmd Msg )
update bigMsg bigModel =
    case ( bigMsg, bigModel ) of
        ( Contact__Msg msg, Contact__Model model ) ->
            pages.contact.update msg model
        
        ( Counter__Msg msg, Counter__Model model ) ->
            pages.counter.update msg model
        
        ( Home___Msg msg, Home___Model model ) ->
            pages.home_.update msg model
        
        _ ->
            ( bigModel, Cmd.none )



-- BUNDLE - (view + subscriptions)


bundle : Model -> Bundle
bundle bigModel =
    case bigModel of
        Contact__Model model ->
            pages.contact.bundle model
        
        Counter__Model model ->
            pages.counter.bundle model
        
        Home___Model model ->
            pages.home_.bundle model


view : Model -> Document Msg
view model =
    (bundle model).view ()


subscriptions : Model -> Sub Msg
subscriptions model =
    (bundle model).subscriptions ()


save : Model -> Shared.Model -> Shared.Model
save model =
    (bundle model).save ()


load : Model -> Shared.Model -> ( Model, Cmd Msg )
load model =
    (bundle model).load ()



-- UPGRADING PAGES


type alias Upgraded params model msg =
    { init : params -> Shared.Model -> ( Model, Cmd Msg )
    , update : msg -> model -> ( Model, Cmd Msg )
    , bundle : model -> Bundle
    }


type alias Bundle =
    { view : () -> Document Msg
    , subscriptions : () -> Sub Msg
    , save : () -> Shared.Model -> Shared.Model
    , load : () -> Shared.Model -> ( Model, Cmd Msg )
    }


upgrade : (model -> Model) -> (msg -> Msg) -> Page params model msg -> Upgraded params model msg
upgrade toModel toMsg page =
    let
        init_ params shared =
            page.init shared (Url.create params shared.key shared.url) |> Tuple.mapBoth toModel (Cmd.map toMsg)

        update_ msg model =
            page.update msg model |> Tuple.mapBoth toModel (Cmd.map toMsg)

        bundle_ model =
            { view = \_ -> page.view model |> Document.map toMsg
            , subscriptions = \_ -> page.subscriptions model |> Sub.map toMsg
            , save = \_ -> page.save model
            , load = \_ -> load_ model
            }

        load_ model shared =
            page.load shared model |> Tuple.mapBoth toModel (Cmd.map toMsg)
    in
    { init = init_
    , update = update_
    , bundle = bundle_
    }


pages :
    { contact : Upgraded Pages.Contact.Params Pages.Contact.Model Pages.Contact.Msg
    , counter : Upgraded Pages.Counter.Params Pages.Counter.Model Pages.Counter.Msg
    , home_ : Upgraded Pages.Home_.Params Pages.Home_.Model Pages.Home_.Msg
    }
pages =
    { contact = Pages.Contact.page |> upgrade Contact__Model Contact__Msg
    , counter = Pages.Counter.page |> upgrade Counter__Model Counter__Msg
    , home_ = Pages.Home_.page |> upgrade Home___Model Home___Msg
    }