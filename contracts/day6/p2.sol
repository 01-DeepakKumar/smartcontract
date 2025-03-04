
pragma solidity ^0.8.18;

// Base contract Shape (now abstract)
abstract contract Shape {
    // Virtual functions to be overridden in the derived contracts
    function getPerimeter() public view virtual returns (uint256);
    function getArea() public view virtual returns (uint256);
}

// Sub-contract Circle
contract Circle is Shape {
    uint256 public radius;

    // Constructor to initialize the radius of the circle
    constructor(uint256 _radius) {
        radius = _radius;
    }

    // Override getPerimeter for Circle: 2 * π * radius
    function getPerimeter() public view override returns (uint256) {
        return 2 * 3141592653589793 * radius / 1000000000000000; // Using 3.141592653589793 as an approximation
    }

    // Override getArea for Circle: π * radius^2
    function getArea() public view override returns (uint256) {
        return 3141592653589793 * radius * radius / 1000000000000000; // Using 3.141592653589793 as an approximation
    }
}

// Sub-contract Rectangle
contract Rectangle is Shape {
    uint256 public length;
    uint256 public width;

    // Constructor to initialize the length and width of the rectangle
    constructor(uint256 _length, uint256 _width) {
        length = _length;
        width = _width;
    }

    // Override getPerimeter for Rectangle: 2 * (length + width)
    function getPerimeter() public view override returns (uint256) {
        return 2 * (length + width);
    }

    // Override getArea for Rectangle: length * width
    function getArea() public view override returns (uint256) {
        return length * width;
    }
}

// Sub-contract Triangle
contract Triangle is Shape {
    uint256 public side1;
    uint256 public side2;
    uint256 public side3;
    uint256 public base;
    uint256 public height;

    // Constructor to initialize the sides, base, and height of the triangle
    constructor(uint256 _side1, uint256 _side2, uint256 _side3, uint256 _base, uint256 _height) {
        side1 = _side1;
        side2 = _side2;
        side3 = _side3;
        base = _base;
        height = _height;
    }

    // Override getPerimeter for Triangle: side1 + side2 + side3
    function getPerimeter() public view override returns (uint256) {
        return side1 + side2 + side3;
    }

    // Override getArea for Triangle: 0.5 * base * height
    function getArea() public view override returns (uint256) {
        return (base * height) / 2;
    }
}
