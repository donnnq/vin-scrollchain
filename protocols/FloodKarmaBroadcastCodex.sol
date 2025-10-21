// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FloodKarmaBroadcastCodex {
    address public admin;

    struct BroadcastEntry {
        string incidentName;
        string broadcastType; // "Live Coverage", "Citizen Testimony", "Audit Summary"
        string codexClause;
        string emotionalTag;
        bool summoned;
        bool aired;
        bool sealed;
    }

    BroadcastEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonBroadcast(string memory incidentName, string memory broadcastType, string memory codexClause, string memory emotionalTag) external onlyAdmin {
        entries.push(BroadcastEntry(incidentName, broadcastType, codexClause, emotionalTag, true, false, false));
    }

    function confirmAiring(uint256 index) external onlyAdmin {
        entries[index].aired = true;
    }

    function sealBroadcastEntry(uint256 index) external onlyAdmin {
        require(entries[index].aired, "Must be aired first");
        entries[index].sealed = true;
    }

    function getBroadcastEntry(uint256 index) external view returns (BroadcastEntry memory) {
        return entries[index];
    }
}
