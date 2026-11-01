module Prop (Prop(..)) where

data Prop = Const Bool
          | Var Char
          | And Prop Prop
          | Or Prop Prop
          | Not Prop
          deriving Show