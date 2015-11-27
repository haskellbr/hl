{-# LANGUAGE EmptyDataDecls        #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE OverloadedStrings     #-}
{-# LANGUAGE TemplateHaskell       #-}
module HL.Messages.Implementation
  where

import           Lucid
import           Yesod hiding (toHtml)

data App = App

mkMessage "App" "config/messages" "en"

_i18n :: Monad m => [Lang] -> AppMessage -> HtmlT m ()
_i18n langs msg = toHtml (renderMessage App langs msg)
