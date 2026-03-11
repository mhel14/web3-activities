// SPDX-License-Identifier: MIT
pragma solidity ^0.8.31;

// ====== Activity 1: Caller and Receiver Contracts ======

contract Caller {
    function callSumOfTwoNums(
        address featuresContract,
        uint256 _x,
        uint256 _y
    ) external view returns (uint) {
        (bool sumSuccess, bytes memory sum) = featuresContract.staticcall(
            abi.encodeWithSignature("getSumOfTwoNums(uint256,uint256)", _x, _y)
        );
        require(sumSuccess, "Calling sum function failed");
        uint256 value = abi.decode(sum, (uint));
        return value;
    }

    function callDiffOfTwoNums(
        address featuresContract,
        uint256 _x,
        uint256 _y
    ) external view returns (uint) {
        (bool diffSuccess, bytes memory byteDiff) = featuresContract.staticcall(
            abi.encodeWithSignature("getDiffOfTwoNums(uint256,uint256)", _x, _y)
        );
        require(diffSuccess, "Calling difference function failed");
        return abi.decode(byteDiff, (uint));
    }

    function callProductOfTwoNums(
        address featuresContract,
        uint256 _x,
        uint256 _y
    ) external view returns (uint) {
        (bool prodSuccess, bytes memory prodBytes) = featuresContract
            .staticcall(
                abi.encodeWithSignature(
                    "getProductOfTwoNums(uint256,uint256)",
                    _x,
                    _y
                )
            );
        require(prodSuccess, "Calling product function failed");
        return abi.decode(prodBytes, (uint256));
    }

    function callQuoOfTwoNums(
        address featuresContract,
        uint256 _x,
        uint256 _y
    ) external view returns (uint) {
        (bool quoSuccess, bytes memory bytesQuo) = featuresContract.staticcall(
            abi.encodeWithSignature(
                "getQuotientOfTwoNums(uint256,uint256)",
                _x,
                _y
            )
        );
        require(quoSuccess, "Calling quotient function failed");
        return abi.decode(bytesQuo, (uint256));
    }
}

contract FeaturesContract {
    function getSumOfTwoNums(
        uint256 x,
        uint256 y
    ) external pure returns (uint) {
        return x + y;
    }

    function getDiffOfTwoNums(
        uint256 x,
        uint256 y
    ) external pure returns (uint) {
        return x - y;
    }

    function getProductOfTwoNums(
        uint256 x,
        uint256 y
    ) external pure returns (uint) {
        return x * y;
    }

    function getQuotientOfTwoNums(
        uint256 x,
        uint256 y
    ) external pure returns (uint) {
        return x / y;
    }
}
