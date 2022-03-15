// SPDX-License-Identifier: MIT

pragma solidity ^0.8.12;

/**
* Contract to get the timestamp of a block
*/
contract Time {

    function getTime() public view returns (uint) {
        return block.timestamp;
    }
}
