module Logic where

import Prop

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