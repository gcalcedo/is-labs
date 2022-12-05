// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.12 <0.9.0;

import "hardhat/console.sol";
import "IntToString.sol";

contract ShareholderVoting {
    address private director;

    mapping(address => bool) private shareholders;
    mapping(uint => mapping(address => bool)) private voters;

    struct Question {
        string text;
        uint votesFor;
        uint votesAgainst;
        bool closed;
    }
    uint private questionCount = 0;
    mapping(uint => Question) private questions;

    enum Vote {
        FOR,
        AGAINST
    }

    modifier onlyDirector() {
        require(msg.sender == director);
        _;
    }

    modifier onlyShareholder() {
        require(shareholders[msg.sender]);
        _;
    }

    constructor() {
        director = msg.sender;
    }

    function addShareholder(address shareholder) public onlyDirector {
        shareholders[shareholder] = true;
    }

    function removeShareholder(address shareholder) public onlyDirector {
        shareholders[shareholder] = false;
    }

    function addQuestion(string calldata text) public onlyDirector returns (uint id) {
        questions[questionCount] = Question(text, 0, 0, false);
        questionCount++;
        return questionCount - 1;
    }

    function closeQuestion(uint id) public onlyDirector {
        questions[id].closed = true;
    }

    function voteForQuestion(uint id, Vote vote) public onlyShareholder {
        require(!questions[id].closed);
        require(!voters[id][msg.sender]);

        voters[id][msg.sender] = true;

        if (vote == Vote.FOR) {
            questions[id].votesFor++;
        } else {
            questions[id].votesAgainst++;
        }
    }

    function getQuestions() public view onlyShareholder {
        for (uint i = 0; i < questionCount; i++) {
            console.log(string.concat(
                questions[i].text, 
                questions[i].closed ? " (Closed)" : " (Open)",
                questions[i].votesFor > questions[i].votesAgainst ? ": Approved" : ": Declined",
                string(abi.encodePacked("For: ", IntToString.toString(questions[i].votesFor), 
                " | Against: ", IntToString.toString(questions[i].votesAgainst)))
            ));
        }
    }
}
