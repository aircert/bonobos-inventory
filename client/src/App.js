import React, { Component } from 'react'
import './App.css'
import Header from './Header'
import Inventory from './Inventory'

class App extends Component {
 
  render() {
    return (
      <div className="App">
        <Header></Header>
        <Inventory></Inventory>
      </div>
    );
  }
}
export default App