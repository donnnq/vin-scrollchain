// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MissileStrikeToCivicResponseLedger {
    address public steward;

    struct StrikeEntry {
        string location; // "Bataysk", "Rostov"
        string civilianSignal; // "Urge strike on Kremlin", "Public retaliation call"
        string emotionalTag;
        bool logged;
        bool sealed;
    }

    StrikeEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function logStrike(string memory location, string memory civilianSignal, string memory emotionalTag) external onlySteward {
        entries.push(StrikeEntry(location, civilianSignal, emotionalTag, true, false));
    }

    function sealStrikeEntry(uint256 index) external onlySteward {
        require(entries[index].logged, "Must be logged first");
        entries[index].sealed = true;
    }

    function getStrikeEntry(uint256 index) external view returns (StrikeEntry memory) {
        return entries[index];
    }
}
