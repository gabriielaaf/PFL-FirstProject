module App (runApp) where

import Parsing
import PropParser
import Logic

evaluateLine :: String -> String
evaluateLine txt =
    case parse prop txt of
        [(tree, "")] -> classify tree
        _ -> "parse error; try again"

runApp :: IO ()
runApp = do
    txt <- getContents
    mapM_ (putStrLn . evaluateLine) (lines txt)