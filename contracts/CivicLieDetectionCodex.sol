// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CivicLieDetectionCodex {
    address public admin;

    struct LieEntry {
        string subjectLabel;
        string falseStatement;
        string emotionalTag;
        uint256 consequenceMultiplier;
        bool confirmed;
    }

    LieEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitLie(string memory subjectLabel, string memory falseStatement, string memory emotionalTag, uint256 consequenceMultiplier) external onlyAdmin {
        entries.push(LieEntry(subjectLabel, falseStatement, emotionalTag, consequenceMultiplier, false));
    }

    function confirmLie(uint256 index) external onlyAdmin {
        entries[index].confirmed = true;
    }

    function getEntry(uint256 index) external view returns (LieEntry memory) {
        return entries[index];
    }
}
