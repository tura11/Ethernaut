// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/Script.sol";
import "../src/Hack.sol";

contract HackScript is Script {
    function run() external {
        address dexAddress = 0xa35F84C6DA31d52183EfF28A811d547d6B0234F8;

        vm.startBroadcast();
        
        Hack hack = new Hack(dexAddress);
        hack.hack();
        
        vm.stopBroadcast();
    }
}