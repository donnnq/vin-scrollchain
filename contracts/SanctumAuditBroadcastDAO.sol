// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SanctumAuditBroadcastDAO {
    address public admin;

    struct BroadcastEntry {
        string sanctumName;
        string auditType;
        string emotionalTag;
        string platform;
        bool archived;
    }

    BroadcastEntry[] public broadcasts;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitBroadcast(string memory _sanctumName, string memory _auditType, string memory _emotionalTag, string memory _platform) external onlyAdmin {
        broadcasts.push(BroadcastEntry(_sanctumName, _auditType, _emotionalTag, _platform, false));
    }

    function archiveBroadcast(uint256 index) external onlyAdmin {
        broadcasts[index].archived = true;
    }

    function getBroadcast(uint256 index) external view returns (BroadcastEntry memory) {
        return broadcasts[index];
    }
}
