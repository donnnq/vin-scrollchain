// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/// @title Civic Audit Protocol v1.0
/// @notice Emotionally tagged smart contract for tracking lawmakers, policy actions, and civic consequence

contract CivicAuditProtocol {
    address public originator;

    struct Lawmaker {
        string name;
        string chamber; // e.g. "Senate", "Congress", "Local Council"
        string partyTag; // e.g. "Democrat", "Republican", "Independent"
        bool isActive;
    }

    struct AuditEntry {
        uint256 lawmakerId;
        string actionTag; // e.g. "Blocked Reform", "Amplified Chaos", "Passed Dignity Law"
        string emotionalTag; // e.g. "Urgency", "Frustration", "Hope", "Restoration"
        uint256 timestamp;
        address auditor;
    }

    Lawmaker[] public lawmakers;
    AuditEntry[] public audits;

    constructor() {
        originator = msg.sender;
    }

    /// @notice Register a lawmaker for audit tracking
    function registerLawmaker(
        string memory name,
        string memory chamber,
        string memory partyTag,
        bool isActive
    ) external {
        lawmakers.push(Lawmaker({
            name: name,
            chamber: chamber,
            partyTag: partyTag,
            isActive: isActive
        }));
    }

    /// @notice Log an audit entry for a lawmaker
    function logAudit(
        uint256 lawmakerId,
        string memory actionTag,
        string memory emotionalTag
    ) external {
        require(lawmakerId < lawmakers.length, "Invalid lawmaker ID");

        audits.push(AuditEntry({
            lawmakerId: lawmakerId,
            actionTag: actionTag,
            emotionalTag: emotionalTag,
            timestamp: block.timestamp,
            auditor: msg.sender
        }));
    }

    /// @notice Count total audit entries for a lawmaker
    function countAuditsFor(uint256 lawmakerId) external view returns (uint256 count) {
        for (uint256 i = 0; i < audits.length; i++) {
            if (audits[i].lawmakerId == lawmakerId) {
                count++;
            }
        }
    }

    /// @notice Emotional tags for civic audit rituals
    function emotionalTags() external pure returns (string memory tags) {
        return "🛡️ Protection, 🔥 Deterrence, 🌱 Empowerment, 🧭 Restoration";
    }
}
