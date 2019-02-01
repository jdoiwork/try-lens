{-# LANGUAGE TemplateHaskell #-}

module Lib
    where

import Control.Lens

someFunc :: IO ()
someFunc = putStrLn "someFunc"

data Address = Address
             { _name :: String
             , _email :: String
             } deriving (Show)

makeLenses ''Address


addr :: Address
addr = Address "jdoi" "jdoi@example.com"

getAddrName :: String
getAddrName = addr ^. name

setAddrName :: String -> Address
setAddrName newName = addr & name .~ newName

