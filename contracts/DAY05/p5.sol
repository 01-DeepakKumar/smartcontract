// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MatrixOperations {

    // 2D array to store the matrix
    int[][] public matrix;

  
    function setMatrix(int[][] memory _matrix) public {
        matrix = _matrix;
    }

    
    function getMatrix() public view returns (int[][] memory) {
        return matrix;
    }

    function transposeMatrix() public {
        
        uint rows = matrix.length;
        uint cols = matrix[0].length;

     
        int[][] memory transposedMatrix = new int[][](cols);

        
        for (uint i = 0; i < cols; i++) {
            transposedMatrix[i] = new int[](rows);
        }

       
        for (uint i = 0; i < rows; i++) {
            for (uint j = 0; j < cols; j++) {
                transposedMatrix[j][i] = matrix[i][j];
            }
        }

        matrix = transposedMatrix;
    }
}
