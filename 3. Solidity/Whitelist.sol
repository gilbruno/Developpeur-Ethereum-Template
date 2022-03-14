// SPDX-License-Identifier:MIT 
pragma solidity ^0.8.12;

contract Whitelist {

    mapping(address => bool) whitelist;

    struct Person {
        string name;
        uint age;
    }

    function addPerson(string memory _name, uint _age) public pure returns (Person memory) {
        Person memory p = Person(_name, _age);
        return p;
    }
}