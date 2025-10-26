// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract HelmetToHighwaySovereigntyClause {
    address public steward;

    struct ClauseEntry {
        string helmetPolicy; // "Mandatory helmet use"
        string jurisdictionScope; // "Only on highways and major roads"
        string emotionalTag; // "Safety with dignity, barangay exemption"
        bool ratified;
        bool sealed;
    }

    ClauseEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function ratifyClause(string memory helmetPolicy, string memory jurisdictionScope, string memory emotionalTag) external onlySteward {
        entries.push(ClauseEntry(helmetPolicy, jurisdictionScope, emotionalTag, true, false));
    }

    function sealClauseEntry(uint256 index) external onlySteward {
        require(entries[index].ratified, "Must be ratified first");
        entries[index].sealed = true;
    }

    function getClauseEntry(uint256 index) external view returns (ClauseEntry memory) {
        return entries[index];
    }
}
