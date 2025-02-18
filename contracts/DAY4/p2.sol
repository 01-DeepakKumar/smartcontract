
pragma solidity >=0.8.2 <0.9.0;

    
   

contract coprime {
    uint public num1;
    uint public num2;
    uint[] public arr; 
   

  
    function get(uint n1, uint n2) public {
        num1 = n1;
        num2 = n2;
    }

   
    function checkcoprime(uint n1, uint n2) public pure returns (bool) {
        uint a = n1;
        uint b = n2;
    
        
        if (a > b) {
            (a, b) = (b, a); 
        }
        
        
        while (b != 0) {
            uint temp = b;
            b = a % b;
            a = temp;
        }
       
        return a == 1;
    }

   
    function checkRange(uint start, uint end) public {
      
        delete arr;
         //delete arr1;

        
        for (uint i = start; i < end; i++) {
            for (uint j = i + 1; j <= end; j++) {
               
                if (checkcoprime(i, j)) {
                    arr.push(i); 
                    arr.push(j); 
                } 
            }
        }
    }


    function getArray() public view returns (uint[] memory) {
        return arr;
    }
}