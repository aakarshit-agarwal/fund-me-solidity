// SPDX-License-Identifier: MIT

pragma solidity ^0.8.20;

import {Test, console} from "forge-std/Test.sol";
import {FundMe} from "../src/FundMe.sol";

contract FundMeTest is Test {
    FundMe fundMe;

    function setUp() external {
        fundMe = new FundMe();
        console.log("This is test setup");
    }

    function testEntryFeeRequirement() public {
        assertEq(fundMe.MINIMUM_USD(), 5 * 10 ** 18);
        console.log("This is a test");
    }

    function testContractOwner() public {
        assertEq(fundMe.i_owner(), address(this));
    }
}
