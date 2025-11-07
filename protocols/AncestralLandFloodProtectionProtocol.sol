// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract AncestralLandFloodProtectionProtocol {
    address public steward;

    struct ProtectionEntry {
        string community;
        string timestamp;
        string floodRiskLevel;
        string protectionStatus;
        string emotionalTag;
    }

    ProtectionEntry[] public protocol;

    event LandProtectionLogged(string community, string timestamp, string floodRiskLevel, string protectionStatus, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function logProtection(
        string memory community,
        string memory timestamp,
        string memory floodRiskLevel,
        string memory protectionStatus,
        string memory emotionalTag
    ) public onlySteward {
        protocol.push(ProtectionEntry(community, timestamp, floodRiskLevel, protectionStatus, emotionalTag));
        emit LandProtectionLogged(community, timestamp, floodRiskLevel, protectionStatus, emotionalTag);
    }
}
