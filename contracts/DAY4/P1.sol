// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TicketingSystem {
    uint public ticketCount; 
    uint public queueSize; 
    
    struct Customer {
        uint ticketNumber;
        string name;
    }
    
  
    mapping(uint => Customer) public customers;

   
    event TicketIssued(uint ticketNumber, string customerName);

    
    constructor(uint _queueSize) {
        require(_queueSize > 0, "Queue size must be greater than 0");
        queueSize = _queueSize;
        ticketCount = 0;
    }
    
   
    function issueTicket(string memory customerName) public {
        require(ticketCount < queueSize, "Queue is full. No more tickets can be issued.");
        
        ticketCount++; 
        
       
        customers[ticketCount] = Customer(ticketCount, customerName);
        
      
        emit TicketIssued(ticketCount, customerName);
    }
    
   
    function getCustomer(uint ticketNumber) public view returns (uint, string memory) {
        require(ticketNumber <= ticketCount, "Ticket number does not exist.");
        
        Customer memory customer = customers[ticketNumber];
        return (customer.ticketNumber, customer.name);
    }
}
