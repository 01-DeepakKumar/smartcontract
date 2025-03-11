// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./MathLibrary.sol";  // Importing the MathLibrary

contract MathTest {
    using MathLibrary for uint256;

    // Test the max and min functions
    function testMaxMin(uint256 a, uint256 b) public pure returns (uint256 maxNum, uint256 minNum) {
        maxNum = a.max(b);
        minNum = a.min(b);
    }

    // Test the factorial function
    function testFactorial(uint256 n) public pure returns (uint256) {
        return n.factorial();
    }

    // Test the Fibonacci function
    function testFibonacci(uint256 n) public pure returns (uint256[] memory) {
        return n.fibonacci();
    }

    // Test if a number is Armstrong number
    function testIsArmstrong(uint256 number) public pure returns (bool) {
        return number.isArmstrong();
    }
}
