// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract LivelihoodFairActivationGrid {
    address public steward;

    struct FairEntry {
        string barangayName;
        string fairType; // "Skill showcase", "Product bazaar", "Remote work onboarding"
        string emotionalTag;
        bool activated;
        bool sealed;
    }

    FairEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function activateFair(string memory barangayName, string memory fairType, string memory emotionalTag) external onlySteward {
        entries.push(FairEntry(barangayName, fairType, emotionalTag, true, false));
    }

    function sealFairEntry(uint256 index) external onlySteward {
        require(entries[index].activated, "Must be activated first");
        entries[index].sealed = true;
    }

    function getFairEntry(uint256 index) external view returns (FairEntry memory) {
        return entries[index];
    }
}
