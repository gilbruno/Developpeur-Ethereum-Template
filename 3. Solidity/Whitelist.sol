// SPDX-License-Identifier:MIT 
pragma solidity ^0.8.12;

contract Whitelist {

    mapping(address => bool) whitelist;

    struct Person {
        string name;
        uint age;
    }
}