// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PlanetaryCybersecurityCodex {
    address public admin;

    struct ThreatEntry {
        string exploitName;
        string platform;
        string emotionalTag;
        bool summoned;
        bool patched;
        bool archived;
    }

    ThreatEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonThreat(string memory exploitName, string memory platform, string memory emotionalTag) external onlyAdmin {
        entries.push(ThreatEntry(exploitName, platform, emotionalTag, true, false, false));
    }

    function patchThreat(uint256 index) external onlyAdmin {
        entries[index].patched = true;
    }

    function archiveThreat(uint256 index) external onlyAdmin {
        entries[index].archived = true;
    }

    function getThreatEntry(uint256 index) external view returns (ThreatEntry memory) {
        return entries[index];
    }
}
