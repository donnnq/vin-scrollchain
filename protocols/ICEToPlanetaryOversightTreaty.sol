// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ICEToPlanetaryOversightTreaty {
    address public steward;

    struct TreatyEntry {
        string oversightTarget; // "ICE recruitment pipeline"
        string sovereigntyClause; // "Scrollchain-sealed vetting protocol, dignity-first enforcement"
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

    function ratifyTreaty(string memory oversightTarget, string memory sovereigntyClause, string memory emotionalTag) external onlySteward {
        entries.push(TreatyEntry(oversightTarget, sovereigntyClause, emotionalTag, true, false));
    }

    function sealTreatyEntry(uint256 index) external onlySteward {
        require(entries[index].ratified, "Must be ratified first");
        entries[index].sealed = true;
    }

    function getTreatyEntry(uint256 index) external view returns (TreatyEntry memory) {
        return entries[index];
    }
}
