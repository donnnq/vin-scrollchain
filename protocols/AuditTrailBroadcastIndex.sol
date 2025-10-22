// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract AuditTrailBroadcastIndex {
    address public admin;

    struct BroadcastEntry {
        string auditSource; // "COA Report", "Ombudsman Filing", "Senate Testimony"
        string broadcastSignal; // "Plunder pattern detected", "Contract anomaly confirmed", "Ghost project flagged"
        string emotionalTag;
        bool broadcasted;
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

    function broadcastAudit(string memory auditSource, string memory broadcastSignal, string memory emotionalTag) external onlyAdmin {
        entries.push(BroadcastEntry(auditSource, broadcastSignal, emotionalTag, true, false));
    }

    function sealBroadcastEntry(uint256 index) external onlyAdmin {
        require(entries[index].broadcasted, "Must be broadcasted first");
        entries[index].sealed = true;
    }

    function getBroadcastEntry(uint256 index) external view returns (BroadcastEntry memory) {
        return entries[index];
    }
}
