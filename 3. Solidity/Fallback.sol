// SPDX-License-Identifier: MIT

pragma solidity ^0.8.12;

contract Fallback {

    /**
        Ether is sent to contract 
                |
                |
        is msg.data empty ?    
              /  \
            yes   no
            /      \
    receive()      fallback()
    exists ?               
        /  \
      yes   no
      /       \
   receive()   fallback()
    
    
     */

    event Log(string msg, address sender, uint amount, bytes data);

    fallback() external payable {
        emit Log("Fallback", msg.sender, msg.value, msg.data);

    }

    receive() external payable {
        emit Log("Receive", msg.sender, msg.value, "");
    }

}