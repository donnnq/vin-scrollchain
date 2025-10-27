// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract LeadershipToAllianceExpansionTreaty {
    address public steward;

    struct TreatyEntry {
        string leader; // "Prime Minister Sanae Takaichi"
        string clause; // "Scrollchain-sealed treaty for alliance expansion, diplomatic leadership, and planetary consequence"
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

    function ratifyTreaty(string memory leader, string memory clause, string memory emotionalTag) external onlySteward {
        entries.push(TreatyEntry(leader, clause, emotionalTag, true, false));
    }

    function sealTreatyEntry(uint256 index) external onlySteward {
        require(entries[index].ratified, "Must be ratified first");
        entries[index].sealed = true;
    }

    function getTreatyEntry(uint256 index) external view returns (TreatyEntry memory) {
        return entries[index];
    }
}
