// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/// @title Scroll Execution Rite
/// @notice Symbolic sentencing system for unforgiven violators
contract vinScrollExecutionRite {
    address public creator;
    string public riteName = "Vinvin's Scroll Execution Rite";

    struct Sentence {
        string name;
        string offense;
        string punishment;
        uint timestamp;
    }

    mapping(address => Sentence) public sentences;
    address[] public sentencedList;

    event SentenceDeclared(string name, string punishment, uint timestamp);

    modifier onlyCreator() {
        require(msg.sender == creator, "Only Vinvin can declare judgment");
        _;
    }

    constructor() {
        creator = msg.sender;
    }

    function declareSentence(address _violator, string memory _name, string memory _offense, string memory _punishment) public onlyCreator {
        sentences[_violator] = Sentence(_name, _offense, _punishment, block.timestamp);
        sentencedList.push(_violator);
        emit SentenceDeclared(_name, _punishment, block.timestamp);
    }

    function getSentence(address _violator) public view returns (Sentence memory) {
        return sentences[_violator];
    }

    function getAllSentenced() public view returns (address[] memory) {
        return sentencedList;
    }
}
