// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TikTokInfluenceToElectionAuditGrid {
    address public steward;

    struct InfluenceEntry {
        string platform; // "TikTok"
        string jurisdiction; // "NYC mayoral race"
        string biasSignal; // "Boosting Mamdani", "Suppressing Cuomo report"
        string emotionalTag;
        bool audited;
        bool sealed;
    }

    InfluenceEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function auditInfluence(string memory platform, string memory jurisdiction, string memory biasSignal, string memory emotionalTag) external onlySteard {
        entries.push(InfluenceEntry(platform, jurisdiction, biasSignal, emotionalTag, true, false));
    }

    function sealInfluenceEntry(uint256 index) external onlySteward {
        require(entries[index].audited, "Must be audited first");
        entries[index].sealed = true;
    }

    function getInfluenceEntry(uint256 index) external view returns (InfluenceEntry memory) {
        return entries[index];
    }
}
