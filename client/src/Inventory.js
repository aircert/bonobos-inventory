import React, { Component } from 'react';
import { Container, Button, Row, Col } from 'reactstrap';
import './Inventory.css'
import $ from 'jquery'

export default class Inventory extends Component {
  constructor(props) {
    super(props)
    this.state = {productsReceived: null}
    this.onClickedViewButton = this.onClickedViewButton.bind(this);
  }
  componentDidMount () {
    // Is triggered on client, but never on server.
    // This is good place to invoke API calls.
    this.getProducts();
  } 
  getProducts() {
    $.ajax({
      url: "http://localhost:3000/products",
      type: "GET",
      context: this, // Allows us to use this.setState inside success
      success: function (result) {
        this.setState({productsReceived: result})
        console.log(this.state.productsReceived)
      }
    });
  }

  onClickedViewButton() {
    alert('hey');
  }

  renderProduct(product) {
    return (
      <Col md="4" key={product.id} className="product">
        <img src={product.product_image} height={300} width={300} onError={(e)=>{e.target.src="http://via.placeholder.com/250x250"}}/>
        <h2>{product.product_name}</h2>
        <p>{product.product_description}</p>
        <Button onClick={() => this.onClickedViewButton()}  block='false'>View</Button>
      </Col>
    )
  }

  render() {
    if (this.state.productsReceived) {
      return (
        <Container>
        <Row>
            {this.state.productsReceived.products.map(this.renderProduct)}
        </Row>
      </Container>
      )
    }
    return <div>Loading...</div>;
  }
}