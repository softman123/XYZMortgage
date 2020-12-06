import React from 'react';  
import { Table,Button } from 'react-bootstrap';  
import axios from 'axios';  
  
const apiUrl = 'http://localhost:49292/api';  
  
class CustomerList extends React.Component{  
    constructor(props){  
        super(props);  
        this.state = {  
           error:null,  
           customers:[],  
           response: {}  
              
        }  
    }  
  
    componentDidMount(){  
       axios.get(apiUrl + '/Customer').then(response => response.data).then(  
            (result)=>{  
                this.setState({  
                    customers:result  
                });  
            },  
            (error)=>{  
                this.setState({error});  
            }  
        )  
    }  
  
      
      
  
    render(){         
        const{error,customers}=this.state;  
        if(error){  
            return(  
                <div>Error:{error.message}</div>  
            )  
        }  
        else  
        {  
            return(  
         <div>  
                  <Table>  
                    <thead className="btn-primary">  
                      <tr>  
                        <th>CustomerId</th> 
                        <th>First Name</th>  
                        <th>Last Name</th>  
                      </tr>  
                    </thead>  
                    <tbody>  
                      {customers.map(customer => (  
                        <tr>
                         <td>{customer.customerId}</td> 
                          <td>{customer.firstName}</td>  
                          <td>{customer.lastName}</td>  
                        </tr>  
                      ))}  
                    </tbody>  
                  </Table>  
                </div>  
              )  
        }  
    }  
}  
  
export default CustomerList;  