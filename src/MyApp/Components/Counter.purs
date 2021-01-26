module MyApp.Components.Counter where

import Prelude

import Data.Interpolate (i)
import Data.Maybe (Maybe(..))
import Data.Tuple.Nested ((/\))
import Effect (Effect)
import React.Basic.DOM (button, div_, p_, text)
import React.Basic.Events (handler_)
import React.Basic.Hooks as React

type Props =
  { label :: String
  , onClick :: Int -> Effect Unit
  , counterType :: CounterType
  }

data CounterType = Incrementer | Decrementer

counterTypeToString :: CounterType -> String
counterTypeToString = case _ of
  Incrementer -> "incrementer"
  Decrementer -> "decrementer"

counterTypeFromString :: String -> Maybe CounterType
counterTypeFromString = case _ of
  "incrementer" -> Just Incrementer
  "decrementer" -> Just Decrementer
  _ -> Nothing

mkCounter :: React.Component Props
mkCounter = React.component "Counter" \props -> React.do
  count /\ setCount <- React.useState' 0

  let
    step n = case props.counterType of
      Incrementer -> n + 1
      Decrementer -> n - 1

  pure do
    div_
      [ p_ [ text $ i "You clicked " count " times" ]
      , button
          { onClick: handler_ do
            let next = step count
            setCount next
            props.onClick next
          , children: [ text props.label ]
          }
      ]
