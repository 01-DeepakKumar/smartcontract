// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

library MathLibrary {
    
    // Function to find the maximum of two numbers
    function max(uint256 a, uint256 b) public pure returns (uint256) {
        if (a > b) {
            return a;
        } else {
            return b;
        }
    }

    // Function to find the minimum of two numbers
    function min(uint256 a, uint256 b) public pure returns (uint256) {
        if (a < b) {
            return a;
        } else {
            return b;
        }
    }

    // Function to calculate the factorial of a number
    function factorial(uint256 n) public pure returns (uint256) {
        require(n >= 0, "n must be non-negative");
        uint256 result = 1;
        for (uint256 i = 1; i <= n; i++) {
            result *= i;
        }
        return result;
    }

    // Function to generate Fibonacci series up to n terms
    function fibonacci(uint256 n) public pure returns (uint256[] memory) {
        uint256[] memory series = new uint256[](n);
        series[0] = 0;
        if (n > 1) {
            series[1] = 1;
            for (uint256 i = 2; i < n; i++) {
                series[i] = series[i - 1] + series[i - 2];
            }
        }
        return series;
    }

    // Function to check if a number is an Armstrong number
    function isArmstrong(uint256 number) public pure returns (bool) {
        uint256 sum = 0;
        uint256 temp = number;
        uint256 digits = 0;

        // Calculate number of digits in the number
        while (temp != 0) {
            digits++;
            temp /= 10;
        }

        temp = number;
        // Calculate the sum of each digit raised to the power of number of digits
        while (temp != 0) {
            uint256 remainder = temp % 10;
            sum += remainder ** digits;
            temp /= 10;
        }

        return sum == number;
    }
}
