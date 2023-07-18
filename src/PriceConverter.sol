// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

library PriceConverter {
    function getVersion(
        AggregatorV3Interface aggregatorV3
    ) internal view returns (uint256) {
        return aggregatorV3.version();
    }

    function getPrice(
        AggregatorV3Interface aggregatorV3
    ) internal view returns (uint256) {
        (, int256 answer, , , ) = aggregatorV3.latestRoundData();
        return uint256(answer * 1e10);
    }

    function getConversionRate(
        uint256 ethAmount,
        AggregatorV3Interface aggregatorV3
    ) internal view returns (uint256) {
        uint256 ethPrice = getPrice(aggregatorV3);
        uint256 ethAmountInUsd = (ethPrice * ethAmount) / 1e18;
        return ethAmountInUsd;
    }
}
