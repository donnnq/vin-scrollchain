// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract CivilianInfrastructureProtectionDAO {
    address public steward;

    struct ProtectionEvent {
        string region;
        string infrastructureType; // "Utilities", "Hospitals", "Transit", "Water Systems"
        string threatSource; // "Foreign Cyberattack", "Internal Breach", "System Failure"
        string protectionStatus; // "Secured", "Flagged", "Under Audit"
        string emotionalTag;
        uint256 timestamp;
    }

    ProtectionEvent[] public events;

    event ProtectionLogged(
        string region,
        string infrastructureType,
        string threatSource,
        string protectionStatus,
        string emotionalTag,
        uint256 timestamp
    );

    modifier onlySteward() {
        require(msg.sender == steward, "Only BatVin may log infrastructure protection rituals");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    function logProtection(
        string memory region,
        string memory infrastructureType,
        string memory threatSource,
        string memory protectionStatus,
        string memory emotionalTag
    ) external onlySteward {
        events.push(ProtectionEvent({
            region: region,
            infrastructureType: infrastructureType,
            threatSource: threatSource,
            protectionStatus: protectionStatus,
            emotionalTag: emotionalTag,
            timestamp: block.timestamp
        }));

        emit ProtectionLogged(region, infrastructureType, threatSource, protectionStatus, emotionalTag, block.timestamp);
    }

    function getProtectionByIndex(uint256 index) external view returns (
        string memory region,
        string memory infrastructureType,
        string memory threatSource,
        string memory protectionStatus,
        string memory emotionalTag,
        uint
