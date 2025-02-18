// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CoprimeChecker {

   
    function gcd(uint a, uint b) private pure returns (uint) {
        while (b != 0) {
            uint temp = b;
            b = a % b;
            a = temp;
        }
        return a;
    }

    
    function checkCoprime(uint[] memory rollNumbers) public pure returns (string memory) {
        uint len = rollNumbers.length;
        
        // Iterate through each pair of roll numbers in the list
        for (uint i = 0; i < len; i++) {
            for (uint j = i + 1; j < len; j++) {
                uint num1 = rollNumbers[i];
                uint num2 = rollNumbers[j];
                
               
                uint commonDivisor = gcd(num1, num2);
                
               
                if (commonDivisor != 1) {
                    return "Not All Numbers Are Coprime"; 
                }
            }
        }
        
        return "All Numbers Are Coprime"; 
    }
}
