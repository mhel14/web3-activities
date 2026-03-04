// SPDX-License-Identifier: MIT
pragma solidity ^0.8.31;

contract FunctionActivities {

    function convertCelciusToFarenheight(int16 celcius) public pure returns(int16) {
        return(celcius * 9 /5) + 32;
    }

    function convertHourToSecond(uint hour) public pure returns(uint) {
        return (hour * 60) * 60;
    }

    function getAveOfThreeNums(uint num1, uint num2, uint num3) public pure returns(uint) {
        return (num1 + num2 + num3) / 3;
    }

    function convertEthToDollar(uint ethAmount, uint ethDollarPrice) public pure returns (uint) {
        return ethAmount * ethDollarPrice;
    }
}