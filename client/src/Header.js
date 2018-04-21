import React from 'react';
import { Container, Jumbotron, Button } from 'reactstrap';

const Header = (props) => {
  return (
    <div>
      <Container>
        <Jumbotron>
          <h1 className="display-3">Bonobos Inventory</h1>
          <h2 className="lead">Goal #3: Make a webpage that displays the data</h2>
          <hr className="my-2" />
          <p>Create a webpage that allows a user to search for a certain term. You should then call the HTTP API you made for Goal #2 and display the returned product information. Inventory information should be grouped by product.</p>
        </Jumbotron>
      </Container>
    </div>
  );
};

export default Header;