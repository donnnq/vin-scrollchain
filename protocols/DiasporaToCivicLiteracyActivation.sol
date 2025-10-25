// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DiasporaToCivicLiteracyActivation {
    address public steward;

    struct LiteracyEntry {
        string contactRegion; // "United States"
        string migrantStatus; // "Legal resident", "Naturalized citizen"
        string activationMethod; // "Digital storytelling", "Community workshops", "Scrollchain education"
        string emotionalTag;
        bool activated;
        bool sealed;
    }

    LiteracyEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function activateLiteracy(string memory contactRegion, string memory migrantStatus, string memory activationMethod, string memory emotionalTag) external onlySteward {
        entries.push(LiteracyEntry(contactRegion, migrantStatus, activationMethod, emotionalTag, true, false));
    }

    function sealLiteracyEntry(uint256 index) external onlySteward {
        require(entries[index].activated, "Must be activated first");
        entries[index].sealed = true;
    }

    function getLiteracyEntry(uint256 index) external view returns (LiteracyEntry memory) {
        return entries[index];
    }
}
