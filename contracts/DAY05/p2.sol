// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ArrayOperations {

    int[] public array;

    
    function insertElement(uint index, int element) public {
        require(index <= array.length, "Index out of bounds");

        
        array.push(0);  
        for (uint i = array.length - 1; i > index; i--) {
            array[i] = array[i - 1];
        }
        array[index] = element;  
    }

   
    function getArray() public view returns (int[] memory) {
        return array;
    }
}
