// SPDX-License-Identifier: MIT

pragma solidity ^0.8.12;

contract SavingWallet {

    //------ STATE VARIABLES ------------------
    address public admin;
    string public name;
    uint public creationTime = block.timestamp; //Timestamp de la 1ère tx
    uint public currentIndexTx;

    //------ MAPPINGS ----------------------
    mapping(uint => uint) public historyOfTx;

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

    function history() public {

    }

    /** 
    function addMonths(uint timestamp, uint _months) internal pure returns (uint newTimestamp) {
        uint year;
        uint month;
        uint day;
        (year, month, day) = _daysToDate(timestamp / SECONDS_PER_DAY);
        month += _months;
        year += (month - 1) / 12;
        month = (month - 1) % 12 + 1;
        uint daysInMonth = _getDaysInMonth(year, month);
        if (day > daysInMonth) {
            day = daysInMonth;
        }
        newTimestamp = _daysFromDate(year, month, day) * SECONDS_PER_DAY + timestamp % SECONDS_PER_DAY;
        require(newTimestamp >= timestamp);
    }
     */
    

    //--------------------------------------------------------------------- withdraw
    function withdraw(uint _amount) external onlyOwner onlyAfter3Months {
        //payable(msg.sender).transfer(_amount);
        (bool sent, ) = payable(msg.sender).call{value: _amount}("");
        require(sent, "Withdrawal Failed !");
    }


}