// SPDX-License-Identifier: MIT
pragma solidity ^0.8.31;

contract ControlFlowActivities {
    function checkTemperature(
        int celciusTemp
    ) external pure returns (string memory) {
        if (celciusTemp <= 0) {
            return "Freezing point";
        } else if (celciusTemp >= 100) {
            return "Boiling point";
        }
        return "Temperature is between cold to hot";
    }

    function getGrade(uint score) external pure returns (string memory grade) {
        if (score >= 90) {
            grade = "A";
        } else if (score >= 80 && score <= 89) {
            grade = "B";
        } else if (score >= 70 && score <= 79) {
            grade = "C";
        } else {
            // TIL: I can't ommit else here it'll throw an error, because I'm using shortcut and not explicit return statement.
            grade = "F";
        }
    }

    function getSpeedRemark(uint speed) external pure returns (string memory) {
        if (speed > 100) {
            return "Overspeeding";
        }
        return "Normal speed below the limit";
    }

    function ageRestrictionCheck(
        uint age
    ) external pure returns (string memory) {
        if (age < 13) {
            return "Not allowed";
        } else if (age >= 13 && age <= 17) {
            return "Guardian required";
        }
        return "Allowed";
    }

    function getSumOf1ToNthNumber(uint n) external pure returns (uint sum) {
        for (uint i = 1; i <= n; i++) {
            sum += i;
        }
    }

    function getSumOfEvenNumbers(uint num) external pure returns (uint sum) {
        for (uint i = 1; i <= num; i++) {
            if (i % 2 == 0) {
                sum += i;
            }
        }
    }
}
