--------------------------------------------------------------------------------
{-# LANGUAGE OverloadedStrings #-}
import           Data.Monoid (mappend)
import           Hakyll


--------------------------------------------------------------------------------
main :: IO ()
main = hakyll $ do

    match "index.html" $ do
        route idRoute
        compile $ do
            let indexCtx =
                    constField "title" "Home"                `mappend`
                    defaultContext

            getResourceBody
                -- >>= applyAsTemplate indexCtx
                >>= loadAndApplyTemplate "templates/empty.html" indexCtx
                >>= relativizeUrls

    match "templates/*" $ compile templateCompiler


--------------------------------------------------------------------------------
postCtx :: Context String
postCtx =
    dateField "date" "%B %e, %Y" `mappend`
    defaultContext

