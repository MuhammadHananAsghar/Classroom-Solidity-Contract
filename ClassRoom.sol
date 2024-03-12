// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 < 0.9.0;

contract ClassRoom {

    uint256 studentCounts;
    
    struct Student {
        string name;
        uint256 rollNumber;
        string department;
    }

    mapping (uint256 => Student) public students;

    function addStudent (string memory _name, uint256 _rollNumber, string memory _department) public {
        students[studentCounts] = Student({
            name: _name,
            rollNumber: _rollNumber,
            department: _department
        });
        studentCounts++;
    }

    function getStudentsCount() public view returns (uint256) {
        return studentCounts;
    }

    function getStudent (uint256 _studentID) public view returns (string memory, uint256, string memory) {
        require(_studentID < studentCounts, "Student ID is out of bounds.");
        Student memory student = students[_studentID];
        return (student.name, student.rollNumber, student.department);
    }
}
