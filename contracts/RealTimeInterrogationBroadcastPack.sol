// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract RealTimeInterrogationBroadcastPack {
    address public admin;

    struct InterrogationEntry {
        string subjectLabel;
        string question;
        string emotionalTag;
        bool answered;
        bool truthful;
    }

    InterrogationEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitQuestion(string memory subjectLabel, string memory question, string memory emotionalTag) external onlyAdmin {
        entries.push(InterrogationEntry(subjectLabel, question, emotionalTag, false, false));
    }

    function markAnswered(uint256 index, bool truthful) external onlyAdmin {
        entries[index].answered = true;
        entries[index].truthful = truthful;
    }

    function getEntry(uint256 index) external view returns (InterrogationEntry memory) {
        return entries[index];
    }
}
