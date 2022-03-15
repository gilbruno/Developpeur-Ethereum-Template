// SPDX-License-Identifier: MIT

pragma solidity ^0.8.12;

contract WhitelistEvent {

    //------------------------------------------------ whitelist
    mapping(address => bool) whitelist;

    //------------------------------------------------ Authorized
    event Authorized(address addr);

    //------------------------------------------------ authorize
    function authorize(address _addr) public {
        whitelist[_addr] = true;
        emit Authorized(_addr);
    }


}