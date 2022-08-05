module Pages.Contact exposing (view)

import View exposing (View)
import Html exposing (..)
import UI

view : View msg
view = 
  { title = "Contact"
  , body = UI.layout
      [ div []
        [ h5 []
          [ text "Email : tsuyama.s.aa@gmail.com"
          , br [] []
          ]
        ]
      ]
  }
