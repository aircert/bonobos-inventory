import React, { Component } from 'react';
import { Form, Input, FormGroup } from 'reactstrap';

export default class SearchBar extends Component {
  constructor(props) {
    super(props)
    this.handleChange = this.handleChange.bind(this);
  }

  handleChange(e) {
    console.log(e.target.value);
    this.props.onUserInput(
      e.target.value
    );
  }

  render() {
    return (
      <Form>
        <FormGroup>
          <Input
            type="text"
            placeholder="Search..."
            value={this.props.filterText}
            onChange={this.handleChange.bind(this)}
          />
        </FormGroup>
      </Form>
    );
  }

}