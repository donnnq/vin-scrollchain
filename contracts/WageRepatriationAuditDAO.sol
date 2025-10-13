// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract WageRepatriationAuditDAO {
    address public steward;

    struct RepatriationEvent {
        string companyName;
        string hostCountry;
        string wageFlowStatus; // "Delayed", "On-Time", "Withheld"
        string auditTrigger; // "Policy Threat", "Currency Controls", "Labor Complaint"
        string emotionalTag;
        uint256 timestamp;
    }

    RepatriationEvent[] public events;

    event RepatriationLogged(
        string companyName,
        string hostCountry,
        string wageFlowStatus,
        string auditTrigger,
        string emotionalTag,
        uint256 timestamp
    );

    modifier onlySteward() {
        require(msg.sender == steward, "Only BatVin may log wage repatriation rituals");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    function logRepatriation(
        string memory companyName,
        string memory hostCountry,
        string memory wageFlowStatus,
        string memory auditTrigger,
        string memory emotionalTag
    ) external onlySteward {
        events.push(RepatriationEvent({
            companyName: companyName,
            hostCountry: hostCountry,
            wageFlowStatus: wageFlowStatus,
            auditTrigger: auditTrigger,
            emotionalTag: emotionalTag,
            timestamp: block.timestamp
        }));

        emit RepatriationLogged(companyName, hostCountry, wageFlowStatus, auditTrigger, emotionalTag, block.timestamp);
    }

    function getRepatriationByIndex(uint256 index) external view returns (
        string memory companyName,
        string memory hostCountry,
        string memory wageFlowStatus,
        string memory auditTrigger,
        string memory emotionalTag,
        uint256 timestamp
    ) {
        require(index < events.length, "Scrollstorm index out of bounds");
        RepatriationEvent memory r = events[index];
        return (
            r.companyName,
            r.hostCountry,
            r.wageFlowStatus,
            r.auditTrigger,
            r.emotionalTag,
            r.timestamp
        );
    }
}
