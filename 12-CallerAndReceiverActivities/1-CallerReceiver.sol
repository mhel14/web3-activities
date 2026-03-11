// SPDX-License-Identifier: MIT
pragma solidity ^0.8.31;

// ====== Activity 1: Caller and Receiver Contracts ======
interface IFeaturesContract {
    function getSumOfTwoNums(uint256, uint256) external pure returns (uint256);

    function getDiffOfTwoNums(int256, int256) external pure returns (int256);

    function getProductOfTwoNums(uint256, uint256) external pure returns (uint);
}

contract Caller {
    IFeaturesContract public features;

    constructor(address _featContractAddress) {
        features = IFeaturesContract(_featContractAddress);
    }

    function callSumOfTwoNums(
        uint256 _x,
        uint256 _y
    ) external view returns (uint) {
        return features.getSumOfTwoNums(_x, _y);
    }

    function callDiffOfTwoNums(
        int256 _x,
        int256 _y
    ) external view returns (int) {
        return features.getDiffOfTwoNums(_x, _y);
    }

    function callProductOfTwoNums(
        uint256 _x,
        uint256 _y
    ) external view returns (uint) {
        return features.getProductOfTwoNums(_x, _y);
    }

    // Applying the low-level calls lesson here.
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

    function getDiffOfTwoNums(int256 x, int256 y) external pure returns (int) {
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
