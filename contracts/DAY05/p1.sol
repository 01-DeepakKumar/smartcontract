// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MatrixOperations {

   
    function addMatrices(int[][] memory matrixA, int[][] memory matrixB) public pure returns (int[][] memory) {
        require(matrixA.length == matrixB.length, "Matrices must have the same number of rows.");
        require(matrixA[0].length == matrixB[0].length, "Matrices must have the same number of columns.");
        
        uint rows = matrixA.length;
        uint cols = matrixA[0].length;
        int[][] memory result = new int[][](rows);
        
        for (uint i = 0; i < rows; i++) {
            result[i] = new int[](cols);
            for (uint j = 0; j < cols; j++) {
                result[i][j] = matrixA[i][j] + matrixB[i][j];
            }
        }
        return result;
    }

   
    function subtractMatrices(int[][] memory matrixA, int[][] memory matrixB) public pure returns (int[][] memory) {
        require(matrixA.length == matrixB.length, "Matrices must have the same number of rows.");
        require(matrixA[0].length == matrixB[0].length, "Matrices must have the same number of columns.");
        
        uint rows = matrixA.length;
        uint cols = matrixA[0].length;
        int[][] memory result = new int[][](rows);
        
        for (uint i = 0; i < rows; i++) {
            result[i] = new int[](cols);
            for (uint j = 0; j < cols; j++) {
                result[i][j] = matrixA[i][j] - matrixB[i][j];
            }
        }
        return result;
    }

  
    function multiplyMatrices(int[][] memory matrixA, int[][] memory matrixB) public pure returns (int[][] memory) {
        require(matrixA[0].length == matrixB.length, "Number of columns in matrix A must equal number of rows in matrix B.");
        
        uint rowsA = matrixA.length;
        uint colsA = matrixA[0].length;
        uint colsB = matrixB[0].length;
        int[][] memory result = new int[][](rowsA);
        
        for (uint i = 0; i < rowsA; i++) {
            result[i] = new int[](colsB);
            for (uint j = 0; j < colsB; j++) {
                int sum = 0;
                for (uint k = 0; k < colsA; k++) {
                    sum += matrixA[i][k] * matrixB[k][j];
                }
                result[i][j] = sum;
            }
        }
        return result;
    }
}
