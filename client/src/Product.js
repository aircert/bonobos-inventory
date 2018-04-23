import React, { Component } from 'react';
import { Button, Col } from 'reactstrap';

export default class Product extends Component {

	handleClick() {
    this.props.onViewClicked(this.props.product.id)
  }

	render() {
		var product = this.props.product
    return (
      <Col md="4" key={product.id} className="product">
			    <img src={product.product_image} height={300} width={300} onError={(e)=>{e.target.src="http://via.placeholder.com/250x250"}} />
			    <h2>{product.product_name}</h2>
			    <p>{product.product_description}</p>
			    <Button onClick={this.handleClick.bind(this)} block={false}>View</Button>
			</Col>
    );
  }

}

