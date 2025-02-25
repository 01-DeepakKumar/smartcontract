// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ArrayReversal {

    // Array to store integers
    int[] public array;

   
    function addElement(int element) public {
        array.push(element);
    }

    
    function reverseArray() public {
        uint start = 0;
        uint end = array.length - 1;

        
        while (start < end) {
            
            int temp = array[start];
            array[start] = array[end];
            array[end] = temp;

            
            start++;
            end--;
        }
    }

   
    function getArray() public view returns (int[] memory) {
        return array;
    }
}
