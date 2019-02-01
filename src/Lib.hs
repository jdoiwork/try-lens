{-# LANGUAGE TemplateHaskell #-}

module Lib
    where

import Control.Lens

someFunc :: IO ()
someFunc = putStrLn "someFunc"

data Address = Address
             { addressName :: String
             , addressEmail :: String
             , addressSub :: SubAddress
             } deriving (Show)

data Address2 = Address2
              { address2Name :: String
              , address2Email :: String
              } deriving (Show)

data SubAddress = SubAddress
                { subAddressName :: String
                , subAddressEmail :: String
                } deriving (Show)

              
--makeLenses ''Address
makeFields ''Address
makeFields ''Address2
makeFields ''SubAddress

addr :: Address
addr = Address "jdoi" "jdoi@example.com" $ SubAddress "aaa" "aaa@example.com"

getAddrName :: String
getAddrName = addr ^. name

getSubAddrName :: String
getSubAddrName = addr ^. sub . name

setAddrName :: String -> Address
setAddrName newName = addr & name .~ newName

setSubAddrName :: String -> Address
setSubAddrName newName = addr & sub . name .~ newName
