// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract BagholderProtectionDAO {
    address public steward;

    struct ProtectionEvent {
        string tokenName; // "BNB", "PEPE", "SHIB"
        string incidentType; // "Sudden Dump", "Exchange Liquidation", "Missed Alpha"
        string protectionStatus; // "Flagged", "Compensated", "Pending"
        string emotionalTag;
        uint256 timestamp;
    }

    ProtectionEvent[] public events;

    event ProtectionLogged(
        string tokenName,
        string incidentType,
        string protectionStatus,
        string emotionalTag,
        uint256 timestamp
    );

    modifier onlySteward() {
        require(msg.sender == steward, "Only Vinvin may log bagholder protection rituals");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    function logProtection(
        string memory tokenName,
        string memory incidentType,
        string memory protectionStatus,
        string memory emotionalTag
    ) external onlySteward {
        events.push(ProtectionEvent({
            tokenName: tokenName,
            incidentType: incidentType,
            protectionStatus: protectionStatus,
            emotionalTag: emotionalTag,
            timestamp: block.timestamp
        }));

        emit ProtectionLogged(tokenName, incidentType, protectionStatus, emotionalTag, block.timestamp);
    }
}
