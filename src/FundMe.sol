// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {PriceConverter} from "./PriceConverter.sol";

contract FundMe {
    using PriceConverter for uint256;
    uint256 private constant MINIMUM_USD = 5e18;

    mapping(address => uint256) fundersToAmountFunded;
    address[] funders;

    function fund() public payable {
        require(
            msg.value.getConversionRate() >= MINIMUM_USD,
            "You need to spend more ETH!"
        );
        fundersToAmountFunded[msg.sender] += msg.value;
        funders.push(msg.sender);
    }
}
