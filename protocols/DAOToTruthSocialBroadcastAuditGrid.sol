// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DAOToTruthSocialBroadcastAuditGrid {
    address public steward;

    struct BroadcastEntry {
        string platform; // "Truth Social"
        string clause; // "Scrollchain-sealed grid for presidential broadcast audit and override consequence"
        string emotionalTag;
        bool audited;
        bool flagged;
    }

    BroadcastEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function auditBroadcast(string memory platform, string memory clause, string memory emotionalTag) external onlySteward {
        entries.push(BroadcastEntry(platform, clause, emotionalTag, true, false));
    }

    function flagBroadcast(uint256 index) external onlySteward {
        entries[index].flagged = true;
    }

    function getBroadcastEntry(uint256 index) external view returns (BroadcastEntry memory) {
        return entries[index];
    }
}
