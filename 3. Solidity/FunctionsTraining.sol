// SPDX-License-Identifier: MIT

pragma solidity ^0.8.12;

contract FunctionsTraining {

    string myString = 'Pura vida !';

    function hello() external view returns (string memory) {
        return myString;
    }
}
