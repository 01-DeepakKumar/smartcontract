// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ArrayOperations {

   
    int[] public array;

    
    function addElement(int element) public {
        array.push(element);
    }

    
    function deleteElement(uint index) public {
        require(index < array.length, "Index out of bounds");

       
        for (uint i = index; i < array.length - 1; i++) {
            array[i] = array[i + 1]; // Shift each element to the left
        }

        
        array.pop();
    }

   
    function getArray() public view returns (int[] memory) {
        return array;
    }
}
