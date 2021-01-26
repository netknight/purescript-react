import React from 'react'
import './App.css'
import { jsCounter as Counter } from './MyApp/Components/Counter/Interop.purs'

const App = () => {
  return (
    <div className="App">
      <Counter />
      <Counter onClick={(n: any) => console.log("clicked: ", n)} />
      <Counter counterType="decrementer" label="Click me!" />
    </div>
  )
}

export default App
