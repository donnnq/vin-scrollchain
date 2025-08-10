// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/// @title Scroll of Solidarity - For those who fight not for borders, but for belief
contract ScrollOfSolidarity {
    address public scrollsmith;
    string public cause = "Ukraine Sovereignty";
    string public allies = "Russian Volunteer Corps, Siberian Battalion";
    string public creed = "Freedom over fear. Dignity over obedience.";

    mapping(address => bool) public supporters;

    event AidCommitted(address indexed supporter, string message);
    event SolidarityDeclared(address indexed supporter);

    constructor() {
        scrollsmith = msg.sender;
    }

    function declareSupport(string memory message) public {
        supporters[msg.sender] = true;
        emit AidCommitted(msg.sender, message);
        emit SolidarityDeclared(msg.sender);
    }

    function isSupporter(address addr) public view returns (bool) {
        return supporters[addr];
    }

    function creedStatement() public pure returns (string memory) {
        return "We fight with those who fight for truth.";
    }
}
