// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

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
    Question[] private questions;

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
        questions.push(Question(text, 0, 0, false));
        uint questionID = questions.length - 1;
        return questionID;
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

    function getQuestions() public view returns (Question[] memory) {
        return questions;
    }
}
