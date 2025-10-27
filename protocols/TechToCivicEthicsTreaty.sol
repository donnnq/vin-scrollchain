// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TechToCivicEthicsTreaty {
    address public steward;

    struct TreatyEntry {
        string tech; // "ICE tracking apps, surveillance tools"
        string ethicsClause; // "Scrollchain-sealed treaty for civic ethics, transparency, and emotional tagging"
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

    function ratifyTreaty(string memory tech, string memory ethicsClause, string memory emotionalTag) external onlySteward {
        entries.push(TreatyEntry(tech, ethicsClause, emotionalTag, true, false));
    }

    function sealTreatyEntry(uint256 index) external onlySteward {
        require(entries[index].ratified, "Must be ratified first");
        entries[index].sealed = true;
    }

    function getTreatyEntry(uint256 index) external view returns (TreatyEntry memory) {
        return entries[index];
    }
}
