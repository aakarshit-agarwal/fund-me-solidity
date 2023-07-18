// SPDX-License-Identifier: MIT

pragma solidity ^0.8.20;

import {Test, console} from "forge-std/Test.sol";
import {FundMe} from "../src/FundMe.sol";
import {DeployFundMe} from "../script/DeployFundMe.s.sol";

contract FundMeTest is Test {
    FundMe fundMe;
    DeployFundMe deployFundMe;

    function setUp() external {
        deployFundMe = new DeployFundMe();
        fundMe = deployFundMe.run();
        console.log("This is test setup");
    }

    function testEntryFeeRequirement() public {
        assertEq(fundMe.MINIMUM_USD(), 5 * 10 ** 18);
        console.log("This is a test");
    }

    function testContractOwner() public {
        assertEq(fundMe.i_owner(), msg.sender);
    }

    function testPriceFeedVersion() public {
        console.log(fundMe.getVersion());
        assertEq(fundMe.getVersion(), 4);
    }
}
