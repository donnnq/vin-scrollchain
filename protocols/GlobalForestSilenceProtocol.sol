// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract GlobalForestSilenceProtocol {
    address public admin;

    struct SilenceEntry {
        string forestZone;
        string silenceType; // "No-Noise Corridor", "Meditation Grove", "Birdsong Sanctuary"
        string protocolClause;
        string emotionalTag;
        bool summoned;
        bool activated;
        bool sealed;
    }

    SilenceEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonSilence(string memory forestZone, string memory silenceType, string memory protocolClause, string memory emotionalTag) external onlyAdmin {
        entries.push(SilenceEntry(forestZone, silenceType, protocolClause, emotionalTag, true, false, false));
    }

    function confirmActivation(uint256 index) external onlyAdmin {
        entries[index].activated = true;
    }

    function sealSilenceEntry(uint256 index) external onlyAdmin {
        require(entries[index].activated, "Must be activated first");
        entries[index].sealed = true;
    }

    function getSilenceEntry(uint256 index) external view returns (SilenceEntry memory) {
        return entries[index];
    }
}
