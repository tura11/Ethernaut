// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract Denial {
    address partner;
    address owner = address(0xA9E);
    mapping(address => uint256) public withdrawPartnerBalances;

    uint256 timelastWithdrawal;
    

    function setWithdrawPartner(address _partner) public {
        partner = _partner;
    }


    function withdraw() public{
        uint256 amountToSend = address(this).balance / 100;

        partner.call{value: amountToSend}("");
        payable(owner).transfer(amountToSend);

        withdrawPartnerBalances[partner] += amountToSend;
        timelastWithdrawal = block.timestamp;


    }


    receive() external payable {}


    function contractBalance() public view returns (uint256) {
        return address(this).balance;
    } 

}
