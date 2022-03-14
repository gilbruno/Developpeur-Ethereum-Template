// SPDX-License-Identifier:MIT 
pragma solidity ^0.8.12;

contract Whitelist {

    mapping(address => bool) whitelist;

    struct Person {
        string name;
        uint age;
    }

    Person[] public persons;

    //--------------------------------------------------------------------- addPerson
    function addPerson(string memory _name, uint _age) public pure returns (Person memory) {
        Person memory p = Person(_name, _age);
        return p;
    }

    //--------------------------------------------------------------------- add
    function add(string memory _name, uint _age) public {
        persons.push(addPerson(_name, _age));
    }

    //--------------------------------------------------------------------- remove
    function remove() public {
        persons.pop();
    }
}