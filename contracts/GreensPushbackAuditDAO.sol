// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract GreensPushbackAuditDAO {
    address public steward;

    struct PushbackEvent {
        string policyTarget; // "Super Tax Reform", "Unrealised Gains", "Indexation"
        string critiqueType; // "Too Soft", "Favoring Wealthy", "Revenue Loss"
        string auditVerdict; // "Amplified", "Flagged", "Neutralized"
        string emotionalTag;
        uint256 timestamp;
    }

    PushbackEvent[] public events;

    event PushbackLogged(
        string policyTarget,
        string critiqueType,
        string auditVerdict,
        string emotionalTag,
        uint256 timestamp
    );

    modifier onlySteward() {
        require(msg.sender == steward, "Only BatVin may log Greens pushback audits");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    function logPushback(
        string memory policyTarget,
        string memory critiqueType,
        string memory auditVerdict,
        string memory emotionalTag
    ) external onlySteward {
        events.push(PushbackEvent({
            policyTarget: policyTarget,
            critiqueType: critiqueType,
            auditVerdict: auditVerdict,
            emotionalTag: emotionalTag,
            timestamp: block.timestamp
        }));

        emit PushbackLogged(policyTarget, critiqueType, auditVerdict, emotionalTag, block.timestamp);
    }

    function getPushbackByIndex(uint256 index) external view returns (
        string memory policyTarget,
        string memory critiqueType,
        string memory auditVerdict,
        string memory emotionalTag,
        uint256 timestamp
    ) {
        require(index < events.length, "Scrollstorm index out of bounds");
        PushbackEvent memory p = events[index];
        return (
            p.policyTarget,
            p.critiqueType,
            p.auditVerdict,
            p.emotionalTag,
            p.timestamp
        );
    }
}
