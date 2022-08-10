module Pages.Home_ exposing (Model, Msg, page)

import Gen.Params.Home_ exposing (Params)
import Page
import Request
import Shared
import View exposing (View)

import Styles.Attr exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)

import UI

-- Shared.Model is our global application state, 
-- which might contain the signed-in user, settings, or other things
-- that should persist as we move from one page to another.

-- Request is a record with access to the current route,
-- query parameters, and any other information about the current URL.

page : Shared.Model -> Request.With Params -> Page.With Model Msg
page _ _ =
    Page.sandbox
        { init = init
        , update = update
        , view = view
        }



-- INIT


type alias Model =
    {}


init : Model
init =
    {}



-- UPDATE


type Msg
    = ReplaceMe


update : Msg -> Model -> Model
update msg model =
    case msg of
        ReplaceMe ->
            model



-- VIEW


view : Model -> View Msg
view model =
    { title = "Home"
    , body = UI.layout <|
        [ h4 [] [text "About me"]
        , p [] [ text mySelf ]
        , br [] []
        , h5 [] [text "学歴"]
        , education
        , br [] []
        , h5 [] [text "職歴"]
        , jobExperiences
        , br [] []
        , p [] [text comment]
        ]
    }


-- 自己紹介文
mySelf : String
mySelf = """
東京工業大学大学院/情報理工学院/数理・計算科学系/数理・計算科学コースの津山勝輝です。大学では数理・計算科学の専攻に所属しており、プログラミング言語に関する研究を行っています。
長所は、物事を論理的に考え、原理や本質を突き詰めようとするところです。新しいものを学ぶときも、どのように使うのかだけでなく、どのような仕組みなのかを意識します。また、面倒見がよく、過去に所属していた生徒会や部活動でも、後輩に慕われ、自分の経験を伝えたりアドバイスをしました。短所は、１つのことに拘ってしまうことがあり要領がよくないところです。とあるものを作るとき複数の手段があると、使い慣れた方法よりも興味を持った方法を選び、その学習に時間を使ってしまうことがあります。
"""


research : String
research = "現在は、依存型言語を用いてインタプリタやコンパイラの正しさを自動証明する方法を探究しています。特に型システムに興味があります。"

-- 職歴
jobExperiences : Html Msg
jobExperiences =
    table []
        [ tbody []
            [ tr []
                [ td [style "align" "left"] [text "2018/10 ~ 2020/7"]
                , td [style "align" "left"] [text "アルバイト(プログラマ)"]
                , td [style "align" "left"] [text "エコノミックインデックス株式会社"]
                ]
            , tr []
                [ td [style "align" "left"] [text "2021/4 ~ 2021/6"]
                , td [style "align" "left"] [text "アルバイト(プログラマ)"]
                , td [style "align" "left"] [text "株式会社アバント"]
                ]
            ]
        ]

-- 学歴
education : Html Msg
education =
    table []
        [ tbody []
            [ tr []
                [ td [style "align" "left"] [text "2018/4 ~ 2022/3"]
                , td [style "align" "left"] [text "学士(理学)"]
                , td [style "align" "left"] [text "東京工業大学 情報理工学院 数理・計算科学系"]
                ]
            , tr []
                [ td [style "align" "left"] [text "2022/4 ~ 2024/3(卒業予定)"]
                , td [style "align" "left"] [text "修士(理学)"]
                , td [style "align" "left"] [text "東京工業大学 情報理工学院 数理・計算科学系 数理・計算科学コース"]
                ]
            ]
        ]


comment : String
comment = """
このページは、Elm言語のSPAフレームワークであるelm-spaを使用して作成しました。
Elm言語とは、フロントエンド開発のための関数型言語です。
代数的データ型やパターンマッチの機能があり、any型が存在せず型安全な実装が可能である点で、
Typescriptよりも快適な開発ができるのではないかと思いました。
また、公式ドキュメントが説明する状態・エフェクトの管理の仕組みもシンプルでわかりやすく、
複雑化してしまった印象のReact(Redux)よりもシンプルなコードで動的なページを作ることができます。
関数型言語が好きな人に限らず、もっと多くの現場で取り入れられる言語になってほしいです。
"""