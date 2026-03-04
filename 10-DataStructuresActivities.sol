// SPDX-License-Identifier: MIT
pragma solidity ^0.8.31;

// Fixed-array
contract FixedArrayActivity {
    uint[3] favoriteNumbers;

    function setNumber(uint index, uint num) external {
        favoriteNumbers[index] = num;
    }

    function getNumber(uint index) external view returns (uint) {
        return favoriteNumbers[index];
    }
}

// Dynamic Array
contract DynamicArrayActivity {
    uint[] scores;

    function addScore(uint score) external {
        scores.push(score);
    }

    function removeLast() external {
        scores.pop();
    }

    function getScore(uint index) external view returns (uint) {
        return scores[index];
    }

    function getTotalScores() external view returns (uint) {
        return scores.length;
    }
}

// Mapping
contract MappingActivity {
    mapping(address => uint) public balances;

    function deposit(uint amount) external payable {
        //validation to check if amount is greater than 0
        // require(amount > 0, "amount can't be 0.");
        balances[msg.sender] += amount;
    }

    function getBalance(address user) external view returns (uint) {
        return balances[user];
    }

    function resetMyBalance(address user) external returns (uint) {
        return balances[user] = 0;
    }
}

// Struct in Array
contract StructInArrayActivity {
    struct Student {
        string name;
        uint age;
        bool isEnrolled;
    }

    Student[] public students;

    function addStudent(
        uint _age,
        string memory _name,
        bool _isEnrolled
    ) external {
        students.push(
            Student({age: _age, name: _name, isEnrolled: _isEnrolled})
        );
    }

    function getStudent(uint index) external view returns (Student memory) {
        return students[index];
    }

    function getTotalStudents() external view returns (uint) {
        return students.length;
    }
}
