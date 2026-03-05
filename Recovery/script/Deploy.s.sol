// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script} from "forge-std/Script.sol";
import {Recovery} from "../src/Recovery.sol";
import {SimpleToken} from "../src/Recovery.sol";
import {console} from "forge-std/console.sol";

contract Deploy is Script {

    function run() public {
        address recoveryAddress = 0x51afec97e7376cD6F8acec42987D91eaE447a1E4;

        address lostToken = address(uint160(uint256(keccak256(abi.encodePacked(
            bytes1(0xd6),
            bytes1(0x94),
            recoveryAddress,
            bytes1(0x01)
            ))))); // we are calculating the lost token contract address by contract who deployed Token and nonce in this case nonce is 1 because its first deploy.
        
        console.log("lostToken: ", lostToken);

        vm.startBroadcast();
        SimpleToken(payable(lostToken)).destroy(payable(msg.sender));
        vm.stopBroadcast();
    }
}
