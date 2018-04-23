import React, { Component } from 'react';
import { Container, Row, Col, FormGroup, Label, Input} from 'reactstrap';
import './Inventory.css'
import Product from './Product'
import SearchBar from './SearchBar'
import $ from 'jquery'

export default class Inventory extends Component {
  constructor(props) {
    super(props)
    this.state = {
      productsReceived: null,
      itemsReceived: null
    }
    this.onClickedViewButton = this.onClickedViewButton.bind(this);
    this.handleUserInput = this.handleUserInput.bind(this);
  }

  componentDidMount () {
    // Is triggered on client, but never on server.
    // This is good place to invoke API calls.
    this.getProducts();
  } 

  getProducts(product_name) {
    $.ajax({
      url: "http://localhost:3000/products",
      type: "GET",
      context: this, // Allows us to use this.setState inside success
      success: function (result) {
        this.setState({productsReceived: result})
      }
    });
  }

  getProductByName(name) {
    $.ajax({
      url: "http://localhost:3000/products?product_name="+name,
      type: "GET",
      context: this, // Allows us to use this.setState inside success
      success: function (result) {
        this.setState({productsReceived: result})
      }
    });
  }

  getInventory(product_id) {
    this.setState({productsReceived: null})
    $.ajax({
      url: "http://localhost:3000/products/"+product_id+"/items",
      type: "GET",
      context: this, // Allows us to use this.setState inside success
      success: function (result) {
        this.setState({
          product: result.product,
          itemsReceived: result.items
        })
      }
    });
  }

  onClickedViewButton(product_id) {
    this.getInventory(product_id)
  }

  handleUserInput(filterText) {
    if (filterText.length > 3) {
      this.getProductByName(filterText)
    } else {
      this.getProducts()
    }
  }

  renderProduct(product) {
    return (
      <Product onViewClicked={this.onClickedViewButton} product={product} key={product.id} />
    )
  }

  //TODO: pull out color into a picker
  renderItem(item) {
    return (
      //TODO: Move into own file and component
      <option value={item.count}>
        {item.waist} - {item.length} - {item.style}
      </option>
    )
  }

  render() {
    if (this.state.productsReceived) {
      return (
        <Container>
          <Row>
              <Col md="12">
                <SearchBar filterText={this.state.filterText} onUserInput={this.handleUserInput}/>
              </Col>
              {this.state.productsReceived.products.map(this.renderProduct, this)}
          </Row>
        </Container>
      )
    } else if(this.state.itemsReceived) {
      return (
        <Container>
          <Row>
            <Col md="8">
              <img src={this.state.product.product_image} height={600} width={600} onError={(e)=>{e.target.src="http://via.placeholder.com/250x250"}} />
            </Col>
            <Col md="4">
              <h1>{this.state.product.product_name}</h1>
              <p>{this.state.product.product_description}</p>
              <FormGroup>
                <Label for="detailSelect">Select</Label>
                <Input type="select" name="select" id="detailSelect">
                  {this.state.itemsReceived.map(this.renderItem, this)}
                </Input>
              </FormGroup>
            </Col>
          </Row>
        </Container>
      )
    }
    return <div className="loading">Loading...</div>;
  }
}