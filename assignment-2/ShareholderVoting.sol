// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract ShareholderVoting {
    address private director;

    mapping(address => bool) private shareholders;
    mapping(uint => address[]) private voters;

    struct Question {
        string text;
        uint votesFor;
        uint votesAgainst;
        bool closed;
    }
    Question[] private questions;

    modifier onlyDirector() {
        require(msg.sender == director);
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
}
