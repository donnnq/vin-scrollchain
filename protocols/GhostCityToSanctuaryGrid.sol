// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract GhostCityToSanctuaryGrid {
    address public steward;

    struct SanctuaryEntry {
        string cityName; // "Ordos", "Yujiapu", "Kangbashi"
        string region; // "Inner Mongolia", "Tianjin"
        string accessStatus; // "Vacant", "Investor-owned", "Unregulated"
        string repurposeSignal; // "Humanitarian relocation", "Diaspora sanctuary"
        string emotionalTag;
        bool activated;
        bool sealed;
    }

    SanctuaryEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function activateSanctuary(string memory cityName, string memory region, string memory accessStatus, string memory repurposeSignal, string memory emotionalTag) external onlySteward {
        entries.push(SanctuaryEntry(cityName, region, accessStatus, repurposeSignal, emotionalTag, true, false));
    }

    function sealSanctuaryEntry(uint256 index) external onlySteward {
        require(entries[index].activated, "Must be activated first");
        entries[index].sealed = true;
    }

    function getSanctuaryEntry(uint256 index) external view returns (SanctuaryEntry memory) {
        return entries[index];
    }
}
