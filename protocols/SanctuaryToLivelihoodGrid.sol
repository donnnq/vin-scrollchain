// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SanctuaryToLivelihoodGrid {
    address public steward;

    struct LivelihoodEntry {
        string sanctuaryLocation; // "Ordos", "Yujiapu", "Kangbashi"
        string supportType; // "Food access", "Job training", "Medical aid"
        string deliveryMethod; // "Diaspora fundrun", "Local steward network"
        string emotionalTag;
        bool deployed;
        bool sealed;
    }

    LivelihoodEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function deployLivelihood(string memory sanctuaryLocation, string memory supportType, string memory deliveryMethod, string memory emotionalTag) external onlySteward {
        entries.push(LivelihoodEntry(sanctuaryLocation, supportType, deliveryMethod, emotionalTag, true, false));
    }

    function sealLivelihoodEntry(uint256 index) external onlySteward {
        require(entries[index].deployed, "Must be deployed first");
        entries[index].sealed = true;
    }

    function getLivelihoodEntry(uint256 index) external view returns (LivelihoodEntry memory) {
        return entries[index];
    }
}
