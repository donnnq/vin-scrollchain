// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BroadcastDualityAuditProtocol {
    address public admin;

    struct BroadcastEntry {
        string platform; // "YouTube", "GMA News"
        string broadcaster; // "Sangkay Janjan", "GMA Integrated News"
        string narrativeFocus; // "ICC arrest rumor", "Plunder complaint"
        string emotionalTag;
        bool audited;
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

    function auditBroadcast(string memory platform, string memory broadcaster, string memory narrativeFocus, string memory emotionalTag) external onlyAdmin {
        entries.push(BroadcastEntry(platform, broadcaster, narrativeFocus, emotionalTag, true, false));
    }

    function sealBroadcastEntry(uint256 index) external onlyAdmin {
        require(entries[index].audited, "Must be audited first");
        entries[index].sealed = true;
    }

    function getBroadcastEntry(uint256 index) external view returns (BroadcastEntry memory) {
        return entries[index];
    }
}
