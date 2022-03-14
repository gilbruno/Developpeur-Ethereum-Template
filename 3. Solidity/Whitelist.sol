// SPDX-License-Identifier:MIT 
pragma solidity ^0.8.12;

contract Whitelist {

    // Mapping "witelist"
    mapping(address => bool) whitelist;

    // Struct Person
    struct Person {
        string name;
        uint age;
    }

    Person[] public persons; //Array of Person

    event Authorized(address _address); //Event

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