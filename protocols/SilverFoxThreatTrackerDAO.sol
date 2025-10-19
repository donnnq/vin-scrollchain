// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SilverFoxThreatTrackerDAO {
    address public admin;

    struct ThreatEntry {
        string campaignName;
        string targetRegion;
        string payload;
        string emotionalTag;
        bool summoned;
        bool logged;
        bool sealed;
    }

    ThreatEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonThreat(string memory campaignName, string memory targetRegion, string memory payload, string memory emotionalTag) external onlyAdmin {
        entries.push(ThreatEntry(campaignName, targetRegion, payload, emotionalTag, true, false, false));
    }

    function logThreat(uint256 index) external onlyAdmin {
        entries[index].logged = true;
    }

    function sealThreat(uint256 index) external onlyAdmin {
        require(entries[index].logged, "Must be logged first");
        entries[index].sealed = true;
    }

    function getThreatEntry(uint256 index) external view returns (ThreatEntry memory) {
        return entries[index];
    }
}
