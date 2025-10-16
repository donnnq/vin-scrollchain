// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PublicScrutinyTribunalPack {
    address public admin;

    struct ScrutinyNote {
        string submittedBy;
        string issueLabel;
        string comment;
        string emotionalTag;
        bool acknowledged;
    }

    ScrutinyNote[] public notes;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitNote(string memory submittedBy, string memory issueLabel, string memory comment, string memory emotionalTag) external onlyAdmin {
        notes.push(ScrutinyNote(submittedBy, issueLabel, comment, emotionalTag, false));
    }

    function acknowledgeNote(uint256 index) external onlyAdmin {
        notes[index].acknowledged = true;
    }

    function getNote(uint256 index) external view returns (ScrutinyNote memory) {
        return notes[index];
    }
}
