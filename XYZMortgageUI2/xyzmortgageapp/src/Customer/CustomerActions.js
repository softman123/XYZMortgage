import React, { Component } from 'react';  
  
import { Container, Button } from 'react-bootstrap';  
import CustomerList from './GetCustomer';  
import axios from 'axios';  
const apiUrl = 'http://localhost:51971/Api/User/';  
  
class CustomerActionApp extends Component {  
  constructor(props) {  
    super(props);  
  
    this.state = {  
      error: null,  
      response: {},  
      customerData: {}
    }  
}
    
  render() {  
 
    return (  
      <div className="App">  
 <Container>  
        <h1 style={{ textAlign: 'center' }}>XYZ Mortgage Customer</h1>  
        <hr></hr>  
        <br></br>  
        <CustomerList />  
         </Container>  
      </div>  
    );  
  }  
}  
export default CustomerActionApp;  