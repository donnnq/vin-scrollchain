// SPDX-License-Identifier: Mythic-Scroll
pragma solidity ^0.8.0;

/// @title BlessingDeckGlobal_AuditLog
/// @author Vinvin
/// @notice Tracks all broadcasted blessings with emotional APR triggers and civic metadata

contract BlessingDeckGlobal_AuditLog {
    address public steward;

    enum Role { Actor, Director, Producer, Steward }

    struct AuditEntry {
        address creator;
        uint256 amount;
        string purpose;
        Role role;
        string[] franchises;
        string timestamp;
        uint256 emotionalAPR; // 0–100 scale of resonance
    }

    AuditEntry[] public auditLog;

    event BlessingLogged(
        address indexed creator,
        uint256 amount,
        string purpose,
        Role role,
        string[] franchises,
        string timestamp,
        uint256 emotionalAPR
    );

    constructor() {
        steward = msg.sender;
    }

    function logBlessing(
        address creator,
        uint256 amount,
        string memory purpose,
        Role role,
        string[] memory franchises,
        string memory timestamp,
        uint256 emotionalAPR
    ) public {
        require(msg.sender == steward, "Only steward may log blessings");
        require(emotionalAPR <= 100, "APR must be between 0 and 100");

        AuditEntry memory entry = AuditEntry(
            creator,
            amount,
            purpose,
            role,
            franchises,
            timestamp,
            emotionalAPR
        );

        auditLog.push(entry);
        emit BlessingLogged(creator, amount, purpose, role, franchises, timestamp, emotionalAPR);
    }

    function getAuditLog() public view returns (AuditEntry[] memory) {
        return auditLog;
    }

    function getBlessingsByCreator(address creator) public view returns (AuditEntry[] memory) {
        uint256 count = 0;
        for (uint256 i = 0; i < auditLog.length; i++) {
            if (auditLog[i].creator == creator) {
                count++;
            }
        }

        AuditEntry[] memory results = new AuditEntry[](count);
        uint256 index = 0;
        for (uint256 i = 0; i < auditLog.length; i++) {
            if (auditLog[i].creator == creator) {
                results[index] = auditLog[i];
                index++;
            }
        }

        return results;
    }
}
