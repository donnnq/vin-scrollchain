// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DAOToNationStateThreatDetectionGrid {
    address public steward;

    struct ThreatEntry {
        string threatName; // "Modular Malware X, Zero-Day Hydra"
        string clause; // "Scrollchain-sealed grid for nation-state threat detection and critical infrastructure consequence"
        string emotionalTag;
        bool detected;
        bool mitigated;
    }

    ThreatEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function detectThreat(string memory threatName, string memory clause, string memory emotionalTag) external onlySteward {
        entries.push(ThreatEntry(threatName, clause, emotionalTag, true, false));
    }

    function markMitigated(uint256 index) external onlySteward {
        entries[index].mitigated = true;
    }

    function getThreatEntry(uint256 index) external view returns (ThreatEntry memory) {
        return entries[index];
    }
}
