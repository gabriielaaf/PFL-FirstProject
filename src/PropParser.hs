module PropParser where

import Parsing
import Prop
import Data.Char

--prop :: Parser Prop
--prop = do t <- term
          --propCont t

constant :: Parser Prop
constant = 
    (do char 'T'
        return (Const True)) 
    <|>
    (do char 'F'
        return (Const False))

name :: Parser Prop
name = do n <- satisfy isLower
          return (Var n)

factor :: Parser Prop
factor = 
    (do char '!'
        p <- factor
        return (Not p))
    <|> name 
    <|> constant 

termCont :: Prop -> Parser Prop
termCont prop = 
    (do 
        char '&'
        f <- factor
        termCont (And prop f))
    <|> return prop