// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FalsehoodConsequenceCodex {
    address public admin;

    struct ConsequenceEntry {
        string subjectLabel;
        string falsehoodType;
        string emotionalTag;
        uint256 caseMultiplier;
        bool enforced;
    }

    ConsequenceEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitConsequence(string memory subjectLabel, string memory falsehoodType, string memory emotionalTag, uint256 caseMultiplier) external onlyAdmin {
        entries.push(ConsequenceEntry(subjectLabel, falsehoodType, emotionalTag, caseMultiplier, false));
    }

    function enforceConsequence(uint256 index) external onlyAdmin {
        entries[index].enforced = true;
    }

    function getEntry(uint256 index) external view returns (ConsequenceEntry memory) {
        return entries[index];
    }
}
