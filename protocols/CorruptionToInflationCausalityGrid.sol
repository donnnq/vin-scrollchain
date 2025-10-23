// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CorruptionToInflationCausalityGrid {
    address public steward;

    struct CausalityEntry {
        string corruptionNode; // "Ghost projects", "Overpricing", "Kickbacks"
        string inflationEffect; // "Price distortion", "Budget leakage", "Market distrust"
        string emotionalTag;
        bool linked;
        bool sealed;
    }

    CausalityEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function linkCausality(string memory corruptionNode, string memory inflationEffect, string memory emotionalTag) external onlySteward {
        entries.push(CausalityEntry(corruptionNode, inflationEffect, emotionalTag, true, false));
    }

    function sealCausalityEntry(uint256 index) external onlySteward {
        require(entries[index].linked, "Must be linked first");
        entries[index].sealed = true;
    }

    function getCausalityEntry(uint256 index) external view returns (CausalityEntry memory) {
        return entries[index];
    }
}
