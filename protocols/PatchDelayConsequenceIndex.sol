// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PatchDelayConsequenceIndex {
    address public steward;

    struct DelayEntry {
        string vulnerabilityID; // "CVE-2025-53770"
        uint256 daysDelayed;
        string affectedSector; // "Government", "Finance", "Education"
        string consequenceType; // "Data breach", "Espionage", "Service disruption"
        string emotionalTag;
        bool indexed;
        bool sealed;
    }

    DelayEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function indexDelay(string memory vulnerabilityID, uint256 daysDelayed, string memory affectedSector, string memory consequenceType, string memory emotionalTag) external onlySteward {
        entries.push(DelayEntry(vulnerabilityID, daysDelayed, affectedSector, consequenceType, emotionalTag, true, false));
    }

    function sealDelayEntry(uint256 index) external onlySteward {
        require(entries[index].indexed, "Must be indexed first");
        entries[index].sealed = true;
    }

    function getDelayEntry(uint256 index) external view returns (DelayEntry memory) {
        return entries[index];
    }
}
