// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

library MathLibrary {
    // Function to compute the square root of a number
    function sqrt(uint256 x) internal pure returns (uint256) {
        uint256 z = (x + 1) / 2;
        uint256 y = x;
        while (z < y) {
            y = z;
            z = (x / z + z) / 2;
        }
        return y;
    }

    // Function to compute the absolute value of a number
    function abs(int256 x) internal pure returns (uint256) {
        return x < 0 ? uint256(-x) : uint256(x);
    }

    // Function to compute the exponentiation of a base raised to a power
    function exp(uint256 base, uint256 exponent) internal pure returns (uint256 result) {
        result = 1;
        for (uint256 i = 0; i < exponent; i++) {
            result *= base;
        }
    }
}

contract Calculator {
    using MathLibrary for uint256;
    using MathLibrary for int256;

    // Add two numbers
    function add(uint256 a, uint256 b) public pure returns (uint256) {
        return a + b;
    }

    // Subtract two numbers
    function subtract(uint256 a, uint256 b) public pure returns (uint256) {
        require(a >= b, "Subtraction would result in a negative number");
        return a - b;
    }

    // Multiply two numbers
    function multiply(uint256 a, uint256 b) public pure returns (uint256) {
        return a * b;
    }

    // Divide two numbers
    function divide(uint256 a, uint256 b) public pure returns (uint256) {
        require(b != 0, "Division by zero is not allowed");
        return a / b;
    }

    // Modular division of two numbers
    function modDivide(uint256 a, uint256 b) public pure returns (uint256) {
        require(b != 0, "Modular division by zero is not allowed");
        return a % b;
    }

    // Square root of a number
    function squareRoot(uint256 a) public pure returns (uint256) {
        return MathLibrary.sqrt(a);
    }

    // Absolute value of a number
    function absoluteValue(int256 a) public pure returns (uint256) {
        return MathLibrary.abs(a);
    }

    // Exponentiation (base raised to the power)
    function exponentiation(uint256 base, uint256 exponent) public pure returns (uint256) {
        return MathLibrary.exp(base, exponent);
    }
}
