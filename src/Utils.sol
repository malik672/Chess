// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.17;

contract Utils {
    function msgSender() external view returns(address){
        return msg.sender;
    }
}
