// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract AncestralSpiceAuditProtocolDAO {
    address public steward;

    struct SpiceEvent {
        string spiceName;
        string originCulture;
        string auditType; // "Colonized", "Revived", "Protected"
        string emotionalTag;
        uint256 timestamp;
    }

    SpiceEvent[] public events;

    event SpiceLogged(
        string spiceName,
        string originCulture,
        string auditType,
        string emotionalTag,
        uint256 timestamp
    );

    modifier onlySteward() {
        require(msg.sender == steward, "Only BatVin may log ancestral spice rituals");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    function logSpice(
        string memory spiceName,
        string memory originCulture,
        string memory auditType,
        string memory emotionalTag
    ) external onlySteward {
        events.push(SpiceEvent({
            spiceName: spiceName,
            originCulture: originCulture,
            auditType: auditType,
            emotionalTag: emotionalTag,
            timestamp: block.timestamp
        }));

        emit SpiceLogged(spiceName, originCulture, auditType, emotionalTag, block.timestamp);
    }

    function getSpiceByIndex(uint256 index) external view returns (
        string memory spiceName,
        string memory originCulture,
        string memory auditType,
        string memory emotionalTag,
        uint256 timestamp
    ) {
        require(index < events.length, "Scrollstorm index out of bounds");
        SpiceEvent memory s = events[index];
        return (
            s.spiceName,
            s.originCulture,
            s.auditType,
            s.emotionalTag,
            s.timestamp
        );
    }
}
