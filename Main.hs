module Main where

import Parsing
import Data.Char

data Prop = Const Bool
          | Var Char
          | And Prop Prop
          | Or Prop Prop
          | Not Prop
          deriving Show

main :: IO ()
main = return ()