// SPDX-License-Identifier: MIT
pragma solidity ^0.8.31;

import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

// Made a mock USD/PHP oracle since none is available for testnet.
interface IMockPHPOracle {
    function latestRoundData() external view returns (int256);

    function updatePrice(int256 newPrice) external;
}

contract ETHToPHPConverter {
    AggregatorV3Interface private ethUsdPriceFeed;
    IMockPHPOracle private usdPhpPriceFeed;

    constructor(address _phpOracleAddress) {
        ethUsdPriceFeed = AggregatorV3Interface(
            //ETH/USd oracle pricefeed for testnet.
            0x694AA1769357215DE4FAC081bf1f309aDC325306
        );
        usdPhpPriceFeed = IMockPHPOracle(_phpOracleAddress);
    }

    function getEthUsdPrice() public view returns (int256) {
        (, int256 ethInUsd, , , ) = ethUsdPriceFeed.latestRoundData();
        return ethInUsd;
    }

    function getUsdPhpPrice() public view returns (int256) {
        return usdPhpPriceFeed.latestRoundData();
    }

    function convertEthToPhp(int256 _wei) external view returns (int256) {
        int256 ethInUsdPrice = getEthUsdPrice();
        require(ethInUsdPrice > 0, "Invalid ETH price");
        int256 usdInPhpRate = getUsdPhpPrice();
        int256 ethInUsd = (_wei * ethInUsdPrice) / 1e18;
        int256 ethInPhp = (ethInUsd * usdInPhpRate) / 1e8;

        return ethInPhp;
    }
}

// Made a mock USD/PHP oracle since none is available for testnet.
// This enable manual update for USD/PHP price
contract MockPHPOracle {
    int256 private price;

    constructor(int256 initialPrice) {
        price = initialPrice;
    }

    function updatePrice(int256 newPrice) external {
        price = newPrice;
    }

    function latestRoundData() external view returns (int256) {
        return price;
    }
}
