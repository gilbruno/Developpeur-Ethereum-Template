// SPDX-License-Identifier: MIT

pragma solidity ^0.8.12;

contract SavingWallet {

    //------ STATE VARIABLES ------------------
    address public admin;
    string public name;
    uint firstTx; //Timestamp de la 1ère tx

    //------ MAPPINGS ----------------------
    mapping(uint => uint) historyOfTx;

    //------ EVENTS ----------------------
    event Log(string msg, uint amount_received);

    //------ CONSTRUCTOR ----------------------
    constructor () {
        admin = msg.sender;
    }

    //------ MODIFIERS ----------------------
    modifier onlyOwner() {
        require(msg.sender == admin, "caller is not admin");
        _;
    }

    modifier onlyAfter3Months() {
        _;
    }


    //------ FUNCTIONS ----------------------
    /**
    * Mandatory function to receive money
     */
    receive() external payable{
        emit Log("Montant recu", msg.value);
    }

    //--------------------------------------------------------------------- withdraw
    function withdraw(uint _amount) external onlyOwner onlyAfter3Months {
        //payable(msg.sender).transfer(_amount);
        (bool sent, ) = payable(msg.sender).call{value: _amount}("");
        require(sent, "Withdrawal Failed !");
    }


}