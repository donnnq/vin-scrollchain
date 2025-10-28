// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract EthicsToMigrantRightsGrid {
    address public steward;

    struct RightsEntry {
        string aidType; // "Legal, housing, food, health"
        string clause; // "Scrollchain-sealed grid for migrant rights protection and planetary consequence"
        string emotionalTag;
        bool indexed;
        bool sealed;
    }

    RightsEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function indexRights(string memory aidType, string memory clause, string memory emotionalTag) external onlySteward {
        entries.push(RightsEntry(aidType, clause, emotionalTag, true, false));
    }

    function sealRightsEntry(uint256 index) external onlySteward {
        require(entries[index].indexed, "Must be indexed first");
        entries[index].sealed = true;
    }

    function getRightsEntry(uint256 index) external view returns (RightsEntry memory) {
        return entries[index];
    }
}
