// SPDX-License-Identifier: MIT

pragma solidity ^0.8.12;

/**
    Contract "SendEther".
    On Remix, deploy this contract with, for instance, 1000 GWei.
    That way this contract will own 1000 Gwei in order to send to the other contract
 */
contract SendEther {

    constructor() payable {

    }

    receive() external payable {

    }

    function send(address payable _to, uint amount) external payable {
        bool sent = _to.send(amount);
        require(sent, "Sending amount failed !");
    }
}

/**
    Contract "EthReceiver"
 */
contract EthReceiver {

    event Log(uint amount, uint gas);

    receive() external payable {
        emit Log(msg.value, gasleft());
    }

}