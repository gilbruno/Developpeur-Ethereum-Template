// SPDX-License-Identifier: MIT

pragma solidity ^0.8.12;

contract Payable {

    address payable public owner;

    constructor () {
        owner = payable(msg.sender);
    }

    /**
    * "payable" type enables to send some wei to this contract. 
    * This smart contract can receive wei/eth
    */
    function deposit() external payable {

    }

    //---------------------------------------------------- getBalance
    function getBalance() external view returns (uint)  {
        return address(this).balance;
    }
}