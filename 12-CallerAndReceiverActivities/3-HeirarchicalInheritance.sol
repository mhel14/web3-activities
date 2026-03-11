// SPDX-License-Identifier: MIT
pragma solidity ^0.8.31;

// ====== Activity 3: Hierarchical Inheritance ======

contract FirstContract {
    function firstFunction() internal pure returns (string memory) {
        return "First function";
    }

    function secondFunction() internal pure returns (string memory) {
        return "Second Function";
    }
}

contract SecondContract is FirstContract {
    function thirdFunction() internal pure returns (string memory) {
        return "Third function";
    }
}

contract LastContract is SecondContract {
    function callFirstFunc() external pure returns (string memory) {
        return firstFunction();
    }

    function callSecondFunc() external pure returns (string memory) {
        return secondFunction();
    }

    function callThirdtFunc() external pure returns (string memory) {
        return thirdFunction();
    }
}
