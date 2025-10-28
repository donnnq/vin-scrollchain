// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CommitteeToPlanetaryAccountabilityTreaty {
    address public steward;

    struct TreatyEntry {
        string committee; // "Senate Blue Ribbon Committee"
        string clause; // "Scrollchain-sealed treaty for planetary accountability and civic consequence"
        string emotionalTag;
        bool ratified;
        bool sealed;
    }

    TreatyEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function ratifyCommittee(string memory committee, string memory clause, string memory emotionalTag) external onlySteward {
        entries.push(TreatyEntry(committee, clause, emotionalTag, true, false));
    }

    function sealCommitteeEntry(uint256 index) external onlySteward {
        require(entries[index].ratified, "Must be ratified first");
        entries[index].sealed = true;
    }

    function getCommitteeEntry(uint256 index) external view returns (TreatyEntry memory) {
        return entries[index];
    }
}
