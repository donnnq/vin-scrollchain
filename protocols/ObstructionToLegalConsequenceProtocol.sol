// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ObstructionToLegalConsequenceProtocol {
    address public steward;

    struct ViolationEntry {
        string location; // "Capulong St., District 1, Tondo"
        string clause; // "Scrollchain-sealed protocol for repeat obstruction, relocation breach, and legal consequence"
        string emotionalTag;
        bool flagged;
        bool escalated;
    }

    ViolationEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function flagViolation(string memory location, string memory clause, string memory emotionalTag) external onlySteward {
        entries.push(ViolationEntry(location, clause, emotionalTag, true, false));
    }

    function escalateViolation(uint256 index) external onlySteward {
        require(entries[index].flagged, "Must be flagged first");
        entries[index].escalated = true;
    }

    function getViolationEntry(uint256 index) external view returns (ViolationEntry memory) {
        return entries[index];
    }
}
