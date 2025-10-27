// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ActivismToTransparencyTreaty {
    address public steward;

    struct TreatyEntry {
        string initiative; // "ICE tracking apps, sanctuary alerts"
        string transparencyClause; // "Scrollchain-sealed treaty for activist intent, civic clarity, and ethical tech deployment"
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

    function ratifyTreaty(string memory initiative, string memory transparencyClause, string memory emotionalTag) external onlySteward {
        entries.push(TreatyEntry(initiative, transparencyClause, emotionalTag, true, false));
    }

    function sealTreatyEntry(uint256 index) external onlySteward {
        require(entries[index].ratified, "Must be ratified first");
        entries[index].sealed = true;
    }

    function getTreatyEntry(uint256 index) external view returns (TreatyEntry memory) {
        return entries[index];
    }
}
