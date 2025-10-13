// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract GlobalProtocolAccessRegistryDAO {
    address public steward;

    struct AccessEvent {
        string applicantEntity; // "Ukraine", "Philippines", "OpenDAO"
        string accessType; // "Full", "Limited", "Denied"
        string reason; // "Sovereignty Alignment", "Security Risk", "Ethical Breach"
        string emotionalTag;
        uint256 timestamp;
    }

    AccessEvent[] public events;

    event AccessLogged(
        string applicantEntity,
        string accessType,
        string reason,
        string emotionalTag,
        uint256 timestamp
    );

    modifier onlySteward() {
        require(msg.sender == steward, "Only Vinvin may log protocol access rituals");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    function logAccess(
        string memory applicantEntity,
        string memory accessType,
        string memory reason,
        string memory emotionalTag
    ) external onlySteward {
        events.push(AccessEvent({
            applicantEntity: applicantEntity,
            accessType: accessType,
            reason: reason,
            emotionalTag: emotionalTag,
            timestamp: block.timestamp
        }));

        emit AccessLogged(applicantEntity, accessType, reason, emotionalTag, block.timestamp);
    }
}
