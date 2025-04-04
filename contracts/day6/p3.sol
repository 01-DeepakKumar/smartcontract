// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

// Base contract Vehicle
contract Vehicle {
    string public make;
    string public model;
    uint public year;
    string public fuelType;

 
    constructor(string memory _make, string memory _model, uint _year, string memory _fuelType) {
        make = _make;
        model = _model;
        year = _year;
        fuelType = _fuelType;
    }

    
    function fuelEfficiency() public pure virtual returns (uint) {
        // Return some default efficiency value
        return 15;
    }


    function distanceTraveled(uint fuelAmount) public pure virtual returns (uint) {
        return fuelAmount * fuelEfficiency();
    }

    function maxSpeed() public pure virtual returns (uint) {
       
        return 120;
    }
}

// Subcontract Truck inheriting from Vehicle
contract Truck is Vehicle {
    uint public cargoCapacity; // Additional property specific to Truck

    // Constructor to initialize truck-specific properties
    constructor(string memory _make, string memory _model, uint _year, string memory _fuelType, uint _cargoCapacity)
        Vehicle(_make, _model, _year, _fuelType) {
        cargoCapacity = _cargoCapacity;
    }

    // Overriding fuel efficiency specific to trucks
    function fuelEfficiency() public pure override returns (uint) {
        return 8; // Trucks typically have a lower fuel efficiency, e.g., 8 km/l
    }

    // Overriding max speed for trucks
    function maxSpeed() public pure override returns (uint) {
        return 100; // Trucks usually have a lower max speed, e.g., 100 km/h
    }
}

// Subcontract Car inheriting from Vehicle
contract Car is Vehicle {
    uint public numDoors; // Additional property specific to Car

    // Constructor to initialize car-specific properties
    constructor(string memory _make, string memory _model, uint _year, string memory _fuelType, uint _numDoors)
        Vehicle(_make, _model, _year, _fuelType) {
        numDoors = _numDoors;
    }

    function fuelEfficiency() public pure override returns (uint) {
        return 15; // Cars typically have higher fuel efficiency, e.g., 15 km/l
    }

    // Overriding max speed for cars
    function maxSpeed() public pure override returns (uint) {
        return 180; // Cars can go faster, e.g., 180 km/h
    }
}

// Subcontract Motorcycle inheriting from Vehicle
contract Motorcycle is Vehicle {
    bool public hasSideCar; // Additional property specific to Motorcycle

    // Constructor to initialize motorcycle-specific properties
    constructor(string memory _make, string memory _model, uint _year, string memory _fuelType, bool _hasSideCar)
        Vehicle(_make, _model, _year, _fuelType) {
        hasSideCar = _hasSideCar;
    }

    // Overriding fuel efficiency specific to motorcycles
    function fuelEfficiency() public pure override returns (uint) {
        return 25; // Motorcycles typically have the highest fuel efficiency, e.g., 25 km/l
    }

    // Overriding max speed for motorcycles
    function maxSpeed() public pure override returns (uint) {
        return 200; // Motorcycles can be faster, e.g., 200 km/h
    }
}