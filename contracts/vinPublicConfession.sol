// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/// @title Public Confession and Redemption Ritual
/// @author vinvin.eth — scroll architect of civic integrity

contract vinPublicConfession {
    address public official;
    string public confession;
    string public redemptionVow;
    bool public hasConfessed;

    event ConfessionDeclared(address indexed official, string message);
    event VowSealed(address indexed official, string vow);

    constructor(address _official) {
        official = _official;
    }

    function declareConfession(string memory _message) public {
        require(msg.sender == official, "Only official can confess.");
        require(!hasConfessed, "Confession already declared.");

        confession = _message;
        hasConfessed = true;
        emit ConfessionDeclared(msg.sender, _message);
    }

    function sealVow(string memory _vow) public {
        require(msg.sender == official, "Only official can seal vow.");
        require(hasConfessed, "Confess first.");

        redemptionVow = _vow;
        emit VowSealed(msg.sender, _vow);
    }
}
