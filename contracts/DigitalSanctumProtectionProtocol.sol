// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/// @title Digital Sanctum Protection Protocol v1.0
/// @notice Emotionally tagged smart contract for shielding sovereign tech builders and whistleblowers

contract DigitalSanctumProtectionProtocol {
    address public originator;

    struct SanctumMember {
        address wallet;
        string name;
        string roleTag; // e.g. "Founder", "Whistleblower", "Protocol Architect"
        bool isUnderThreat;
        string threatTag; // e.g. "Surveillance", "Poisoning", "Legal Pressure"
        string emotionalTag; // e.g. "Urgency", "Courage", "Mercy"
    }

    SanctumMember[] public members;

    constructor() {
        originator = msg.sender;
    }

    /// @notice Register a digital sanctum member
    function registerMember(
        string memory name,
        string memory roleTag,
        bool isUnderThreat,
        string memory threatTag,
        string memory emotionalTag
    ) external {
        members.push(SanctumMember({
            wallet: msg.sender,
            name: name,
            roleTag: roleTag,
            isUnderThreat: isUnderThreat,
            threatTag: threatTag,
            emotionalTag: emotionalTag
        }));
    }

    /// @notice Count members currently under threat
    function countThreatened() external view returns (uint256 count) {
        for (uint256 i = 0; i < members.length; i++) {
            if (members[i].isUnderThreat) {
                count++;
            }
        }
    }

    /// @notice Emotional tags for digital sanctum rituals
    function emotionalTags() external pure returns (string memory tags) {
        return "🛡️ Protection, 🔥 Deterrence, 🌱 Empowerment, 🧭 Restoration";
    }
}
