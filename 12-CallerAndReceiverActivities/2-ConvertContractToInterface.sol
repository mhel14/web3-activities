// SPDX-License-Identifier: MIT
pragma solidity ^0.8.31;

interface IStudentRegistry {
    function register(string memory _name, uint256 _age) external;

    function getStudent(
        address _addr
    ) external view returns (string memory, uint256);

    function isRegistered(address _addr) external view returns (bool);
}

contract StudentRegistry {
    struct Student {
        string name;
        uint age;
    }

    mapping(address => Student) public students;

    // Register a new student
    function register(string memory _name, uint _age) public {
        students[msg.sender] = Student(_name, _age);
    }

    // Get student details
    function getStudent(
        address _addr
    ) public view returns (string memory, uint) {
        Student memory s = students[_addr];
        return (s.name, s.age);
    }

    // Check if a student exists
    function isRegistered(address _addr) public view returns (bool) {
        return bytes(students[_addr].name).length > 0;
    }
}
