// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SeafarerToEmbassyHotlineProtocol {
    address public steward;

    struct HotlineEntry {
        string seafarerID;
        string embassyLocation; // "Washington D.C.", "Los Angeles"
        string hotlineType; // "Legal aid", "Visa revocation", "Forced deportation"
        string emotionalTag;
        bool activated;
        bool sealed;
    }

    HotlineEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function activateHotline(string memory seafarerID, string memory embassyLocation, string memory hotlineType, string memory emotionalTag) external onlySteward {
        entries.push(HotlineEntry(seafarerID, embassyLocation, hotlineType, emotionalTag, true, false));
    }

    function sealHotlineEntry(uint256 index) external onlySteward {
        require(entries[index].activated, "Must be activated first");
        entries[index].sealed = true;
    }

    function getHotlineEntry(uint256 index) external view returns (HotlineEntry memory) {
        return entries[index];
    }
}
