// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.12 <0.9.0;

import "hardhat/console.sol";
import "@openzeppelin/contracts/utils/Strings.sol";

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
        require(msg.sender == director, "Only the director can perform this action.");
        _;
    }

    modifier onlyShareholder() {
        require(shareholders[msg.sender], "Only shareholders can perform this action.");
        _;
    }

    modifier directorOrShareholder() {
        require(
            msg.sender == director || shareholders[msg.sender],
            "Only the director or shareholders can perform this action."
        );
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
        require(!questions[id].closed, "This question is already closed.");
        require(!voters[id][msg.sender]);

        voters[id][msg.sender] = true;

        if (vote == Vote.FOR) {
            questions[id].votesFor++;
        } else {
            questions[id].votesAgainst++;
        }
    }

    function getQuestion(uint id) public view directorOrShareholder returns (string memory) {
        require(id < questionCount, "ID is invalid.");

        return string.concat(
            Strings.toString(id),
            " - ",
            questions[id].text,
            questions[id].closed ? " (Closed)" : " (Open)",
            questions[id].closed
                ? (questions[id].votesFor > questions[id].votesAgainst ? ": Approved" : ": Declined")
                : "",
            " - Votes For: ", Strings.toString(questions[id].votesFor), 
            " | Against: ", Strings.toString(questions[id].votesAgainst)
        );
    }

    function showQuestions() public view directorOrShareholder {
        for (uint i = 0; i < questionCount; i++) {
            console.log(getQuestion(i));
        }
    }
}
