-- | Home page controller.

module HL.Controller.Home where

import Data.Aeson
import HL.Controller
import HL.Model.Videos
import HL.View
import HL.View.Home
import Text.Julius
import qualified Text.Blaze.Html as Blaze
import HL.Messages

-- | Home controller.
getHomeR :: HandlerT App IO Blaze.Html
getHomeR =
  do l <- languages
     vids <- getHomeVideos
     html <- renderText <$> lucid (homeV l vids)
     let msg = toJSON . i18n l
     defaultLayout $
       do toWidget $(juliusFileReload "static/js/tryhaskell.pages.julius")
          toWidgetBody (Blaze.preEscapedToHtml html)
