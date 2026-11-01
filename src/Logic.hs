module Logic where

import Prop
import Data.List (nub)

type Env = [(Char, Bool)]

eval :: Env -> Prop -> Bool
eval _ (Const b) = b

eval [] (Var x) = error "undefined variable"

eval ((char,bool) : xs) (Var x)
    | char == x = bool 
    | otherwise = eval xs (Var x)

eval env (Not p) = not (eval env p)

eval env (And p q) = (eval env p) && (eval env q)

eval env (Or p q) = (eval env p) || (eval env q)

vars :: Prop -> [Char]
vars (Const _) = []
vars (Var x) = [x]
vars (Not p) = vars p
vars (And p q) = vars p ++ vars q
vars (Or p q) = vars p ++ vars q

varsUnique :: Prop -> [Char]
varsUnique p = nub (vars p)