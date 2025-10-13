// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract TrustlineFrictionAuditProtocolDAO {
    address public steward;

    struct FrictionEvent {
        string userType; // "Retail", "Institutional", "Developer"
        string frictionPoint; // "Trustline Setup", "UX Confusion", "Wallet Incompatibility"
        string auditStatus; // "Flagged", "Resolved", "Pending"
        string emotionalTag;
        uint256 timestamp;
    }

    FrictionEvent[] public events;

    event FrictionLogged(
        string userType,
        string frictionPoint,
        string auditStatus,
        string emotionalTag,
        uint256 timestamp
    );

    modifier onlySteward() {
        require(msg.sender == steward, "Only BatVin may log trustline friction audits");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    function logFriction(
        string memory userType,
        string memory frictionPoint,
        string memory auditStatus,
        string memory emotionalTag
    ) external onlySteward {
        events.push(FrictionEvent({
            userType: userType,
            frictionPoint: frictionPoint,
            auditStatus: auditStatus,
            emotionalTag: emotionalTag,
            timestamp: block.timestamp
        }));

        emit FrictionLogged(userType, frictionPoint, auditStatus, emotionalTag, block.timestamp);
    }

    function getFrictionByIndex(uint256 index) external view returns (
        string memory userType,
        string memory frictionPoint,
        string memory auditStatus,
        string memory emotionalTag,
        uint256 timestamp
    ) {
        require(index < events.length, "Scrollstorm index out of bounds");
        FrictionEvent memory f = events[index];
        return (
            f.userType,
            f.frictionPoint,
            f.auditStatus,
            f.emotionalTag,
            f.timestamp
        );
    }
}
