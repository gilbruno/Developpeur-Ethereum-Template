// SPDX-License-Identifier: MIT

pragma solidity ^0.8.12;

contract Choice {

    mapping(address => uint) choices;

    function add(uint _myuint) public {
        choices[msg.sender] = _myuint;
    }
}