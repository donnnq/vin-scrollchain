// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract RiderToEmergencyHotlineProtocol {
    address public steward;

    struct HotlineEntry {
        string platform; // "Shopee, Lazada"
        string hotlineType; // "Emergency support, payout dispute, safety incident"
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

    function activateHotline(string memory platform, string memory hotlineType, string memory emotionalTag) external onlySteward {
        entries.push(HotlineEntry(platform, hotlineType, emotionalTag, true, false));
    }

    function sealHotlineEntry(uint256 index) external onlySteward {
        require(entries[index].activated, "Must be activated first");
        entries[index].sealed = true;
    }

    function getHotlineEntry(uint256 index) external view returns (HotlineEntry memory) {
        return entries[index];
    }
}
