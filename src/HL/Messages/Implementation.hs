{-# LANGUAGE EmptyDataDecls        #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE OverloadedStrings     #-}
{-# LANGUAGE TemplateHaskell       #-}
module HL.Messages.Implementation
  where

import Data.Text (Text)
import Lucid
import Yesod hiding (toHtml)

import Debug.Trace

data App = App

mkMessage "App" "config/messages" "en"

i18n :: [Lang] -> AppMessage -> Text
i18n langs msg | traceShow ("langs", langs) True = renderMessage App ["pt"] msg

i18n_ :: Monad m => [Lang] -> AppMessage -> HtmlT m ()
i18n_ langs msg = toHtml (renderMessage App ["pt"] msg)
