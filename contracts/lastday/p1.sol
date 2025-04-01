// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Department Interface (No state variables allowed)
interface Department {
    // Abstract method to print the department details
    function printDeptDetails() external view returns (string memory, string memory);
}

// Hostel Contract
contract Hostel {
    string public hostelName = "Deepak ka hostel"; // Name of the hostel
    string public hostelLocation = "Patna";  // Location of the hostel
    uint public numberOfRooms = 100;                // Number of rooms in the hostel
    
    // Method to get hostel details (view function as it does not modify state)
    function getHostelDetails() public view returns (string memory, string memory, uint) {
        return (hostelName, hostelLocation, numberOfRooms);
    }
    
    // Method to print hostel details (view function as it does not modify state)
    function printHostelDetails() public view returns (string memory, string memory, uint) {
        return (hostelName, hostelLocation, numberOfRooms);
    }
}

// Student Contract
contract Student is Department, Hostel {
    string public deptName;
    string public deptHead;
    
    string public studentName;
    string public regdNo;
    string public electiveSubject;
    uint public avgMarks;

    // Constructor to initialize department details
    constructor(string memory _deptName, string memory _deptHead) {
        deptName = _deptName; // Department name
        deptHead = _deptHead; // Department Head
    }

    // Method to input data for a student
    function getData(string memory _studentName, string memory _regdNo, string memory _electiveSubject, uint _avgMarks) public {
        studentName = _studentName;
        regdNo = _regdNo;
        electiveSubject = _electiveSubject;
        avgMarks = _avgMarks;
    }

    // Method to print student data (view function as it does not modify state)
    function printData() public view returns (string memory, string memory, string memory, uint) {
        return (studentName, regdNo, electiveSubject, avgMarks);
    }

    // Implementing abstract method to print department details (view function as it does not modify state)
    function printDeptDetails() public view override returns (string memory, string memory) {
        return (deptName, deptHead);
    }
}

// Driver Contract
contract StudentManagement {
    mapping(string => Student) public students;  // Mapping to store students by their registration number
    address[] public studentAddresses;  // To keep track of all student contract addresses

    // Admit new student
    function admitNewStudent(
        string memory _deptName,
        string memory _deptHead,
        string memory _studentName,
        string memory _regdNo,
        string memory _electiveSubject,
        uint _avgMarks
    ) public {
        Student student = new Student(_deptName, _deptHead);
        student.getData(_studentName, _regdNo, _electiveSubject, _avgMarks);
        students[_regdNo] = student;
        studentAddresses.push(address(student));  // Add the student's contract address to the list
    }

    // Migrate a student (view function as it only reads data, not modifying state)
    function migrateStudent(string memory _regdNo) public view returns (string memory) {
        Student student = students[_regdNo];
        require(address(student) != address(0), "Student not found.");
        
        // Example of a migration process (can be customized)
        return "Migration process initiated for student with Registration Number: ";
    }

    // Display details of a student (view function as it only reads data, not modifying state)
    function displayStudentDetails(string memory _regdNo) public view returns (
        string memory studentName, 
        string memory regdNo, 
        string memory electiveSubject, 
        uint avgMarks, 
        string memory deptName, 
        string memory deptHead, 
        string memory hostelName, 
        string memory hostelLocation, 
        uint numberOfRooms
    ) {
        // Fetch student contract
        Student student = students[_regdNo];
        require(address(student) != address(0), "Student not found.");
        
        // Fetch student data
        (studentName, regdNo, electiveSubject, avgMarks) = student.printData();
        
        // Fetch department details
        (deptName, deptHead) = student.printDeptDetails();
        
        // Fetch hostel details
        (hostelName, hostelLocation, numberOfRooms) = student.printHostelDetails();
        
        // Return all the details
        return (studentName, regdNo, electiveSubject, avgMarks, deptName, deptHead, hostelName, hostelLocation, numberOfRooms);
    }
}
