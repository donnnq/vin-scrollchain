// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract RelocationToDignityProtocol {
    address public steward;

    struct RelocationEntry {
        string familyID; // "Catmon-Family-001"
        string relocationSite; // "Modular Housing Zone A", "Permanent Shelter Phase 1"
        string dignitySignal; // "Safe housing", "Scrollchain verified", "Community consent"
        string emotionalTag;
        bool relocated;
        bool sealed;
    }

    RelocationEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function relocateFamily(string memory familyID, string memory relocationSite, string memory dignitySignal, string memory emotionalTag) external onlySteward {
        entries.push(RelocationEntry(familyID, relocationSite, dignitySignal, emotionalTag, true, false));
    }

    function sealRelocationEntry(uint256 index) external onlySteward {
        require(entries[index].relocated, "Must be relocated first");
        entries[index].sealed = true;
    }

    function getRelocationEntry(uint256 index) external view returns (RelocationEntry memory) {
        return entries[index];
    }
}
