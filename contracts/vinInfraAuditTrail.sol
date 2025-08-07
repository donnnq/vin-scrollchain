// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

/// @title vinInfraAuditTrail.sol
/// @notice Stores and syncs infrastructure updates for long-term civic transparency.

contract vinInfraAuditTrail {
    address public steward;
    uint256 public logCount;

    struct AuditLog {
        uint256 id;
        string siteName;
        string updateSummary;
        string documentLink;
        uint256 timestamp;
    }

    mapping(uint256 => AuditLog) public logs;

    event LogSubmitted(uint256 indexed id, string siteName);

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized.");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    function submitLog(
        string memory _siteName,
        string memory _updateSummary,
        string memory _documentLink
    ) public onlySteward {
        logCount++;
        logs[logCount] = AuditLog(logCount, _siteName, _updateSummary, _documentLink, block.timestamp);
        emit LogSubmitted(logCount, _siteName);
    }

    function viewLog(uint256 _id) public view returns (AuditLog memory) {
        return logs[_id];
    }

    function totalLogs() public view returns (uint256) {
        return logCount;
    }
}
