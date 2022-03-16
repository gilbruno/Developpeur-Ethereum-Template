// SPDX-License-Identifier: MIT

pragma solidity ^0.8.12;

/**
    GuessAndWin Game
    Le jeu doit donc
        1) instancier un owner
        2) permettre a l'owner de mettre un mot et un indice
        3) les autres joueurs vont avoir un getter sur l'indice
        4) ils peuvent proposer un mot, qui sera comparé au mot référence, return un boolean
        5) les joueurs seront inscrit dans un mapping qui permet de savoir si il a déjà joué
        6) avoir un getter, qui donne si il existe le gagnant.
        7) facultatif (necessite un array): faire un reset du jeu pour relancer une instance
 */
contract GuessAndWin {

    //------ STATE VARIABLES ------------------
    address public owner;
    string public word;
    string public clue;
    string public word2;
    address public winner;

    //------ MAPPING ----------------------
    mapping(address => bool) players;

    //------ EVENTS ----------------------
    event Log(string msg);

    //------ CONSTRUCTOR ----------------------
    constructor () {
        owner = msg.sender;
    }

    //------ MODIFIERS ----------------------
    modifier onlyOwner() {
        require(owner == msg.sender, "Owner only");
        _;
    }

    //------ FUNCTIONS ----------------------
    /**
     * Get the clue : everyone can view it
     */
    function getClue() public view returns (string memory) {
        return clue;
    }

    /**
     * Get the word : only owner can view it
     */    
    function getWord() public view onlyOwner returns (string memory) {
        return word;
    }

    /**
     * Set the word and clue : only owner can set it
     */    
    function setWordAndClue(string memory _word, string memory _clue) public onlyOwner {
        word = _word;        
        clue = _clue;
    }

    /**
     * Set the word2 : everyone can set it
     */    
    function setWord2(string memory _word) public {
        word2 = _word;        
        addPlayers();
        compareWords();
    }

    /**
     * Add the player in the players mapping and set the value to 'true' to indicate that he already played
     */    
    function addPlayers() private {
        players[msg.sender] = true;
    }

    /**
     * This function comes from https://github.com/ethereum/dapp-bin/blob/master/library/stringUtils.sol    
     */
    function compare(string memory _a, string memory _b) private pure returns (int) {
        bytes memory a = bytes(_a);
        bytes memory b = bytes(_b);
        uint minLength = a.length;
        if (b.length < minLength) minLength = b.length;
        //@todo unroll the loop into increments of 32 and do full 32 byte comparisons
        for (uint i = 0; i < minLength; i ++)
            if (a[i] < b[i])
                return -1;
            else if (a[i] > b[i])
                return 1;
        if (a.length < b.length)
            return -1;
        else if (a.length > b.length)
            return 1;
        else
            return 0;
    }

    /**
     * 
     */
    function equal(string memory _a, string memory _b) private pure returns (bool) {
        return compare(_a, _b) == 0;
    }

    /**
     * Compare "word" and "word2". If word2 == word, the player wins ! 
     */
    function compareWords() private {
        if (equal(word, word2)) {
            emit Log("YOU WIN !");
            winner = msg.sender;
        }
        
    }

}