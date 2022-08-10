module Pages.Articles exposing (Model, Msg, page)

import Gen.Params.Articles exposing (Params)
import Page
import Request
import Shared
import View exposing (View)

import UI
import Html exposing (..)
import Html.Attributes exposing (..)
import Components.Material exposing (row)
import Components.Material exposing (column)

page : Shared.Model -> Request.With Params -> Page.With Model Msg
page _ _ =
    Page.element
        { init = init
        , update = update
        , view = view
        , subscriptions = subscriptions
        }


-- INIT


type alias Model =
    {}


init : ( Model, Cmd Msg )
init =
    ( {}, Cmd.none )



-- UPDATE


type Msg
    = ReplaceMe


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        ReplaceMe ->
            ( model, Cmd.none )



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none



-- VIEW


view : Model -> View Msg
view model = 
    {
        title = "Publications",
        body = UI.layout <|
            [ entry
                "WITS2022での研究発表"
                """
                WITSという型システムの実装に関するワークショップでの発表です。
                今後の研究についてのアドバイスをたくさんいただきました。
                初めての海外ワークショップで、この分野のプロフェッショナルに聞いていただくので、
                大変緊張しました。
                """
                "WITS2022"
            , entry
                "JSSST2021でのポスター発表"
                """
                B4時代のJSSST2021ポスター発表です。
                初めての対外発表で、大変貴重な経験でした。
                """
                "JSSST"
            , entry
                "Tagless Final入門"
                """
                M1時代の研究室セミナー発表です。
                Tagless Finalという型安全なDSLの構築アプローチの紹介です。
                """
                "Tagless"
            , entry
                "Quantitative Types入門"
                """
                B4時代の研究室セミナー発表です。
                Quantitative Typesの機能とその型システムを持つIdris2のチュートリアルです。
                できるかぎり理論の話に偏らないようにして、シンプルな例と説明で利点を理解させっることができるように努めました。
                """
                "QTT"
            , entry
                "卒論発表"
                """
                B4時代の卒業論文発表に使ったスライドです。
                実力不足により、聴衆に理解させられなかったので無念でした。
                """
                "BThesis"
            ,  entry
                "依存型によるIntrinsically-typed Interpreter"
                """
                B4時代の研究室セミナー発表です。研究テーマであるIntrinsically-typed Interpreter
                について解説しました。このときは代数的エフェクトを持つ言語についての実装を考えていました。
                """
                "Intri"
            , entry
                "Bidirectional Programming 入門"
                """
                B4時代の初めての研究室セミナー発表です。
                Bidirectional Programmingの概念の解説と、
                HaskellでBidirectional Programmingするためのライブラリ「BiGUL」を紹介しました。
                当時はスライド制作に慣れていなかったので、だいぶ下手に見えるかもしれません。
                """
                "IntroBiGUL"
            ]
    }


entry : String -> String -> String -> Html msg
entry title desc filename =
    row
    [ column 5
        [ a [ href <| "/pdf/" ++ filename ++ ".pdf"
            , target "_blank"
            , rel "noopener noreferrer"
            ]
            [h5 [] [text title]]
        , p [] [text desc]
        ]
    , column 7
        [ iframe 
            [ src <| "/pdf/" ++ filename ++ ".pdf"
            , style "width" "40vw"
            , style "height" "40vh"
            ] []
        ]
    ]

