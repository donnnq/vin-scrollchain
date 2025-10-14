// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract YouthEvacuationSovereigntyProtocolDAO {
    address public steward;

    struct EvacuationEvent {
        string schoolOrSanctum; // "Northville Academy", "Barangay Youth Center"
        string evacuationType; // "Drill", "Actual", "Simulation"
        string sovereigntyStatus; // "Autonomous", "Assisted", "Pending"
        string emotionalTag;
        uint256 timestamp;
    }

    EvacuationEvent[] public events;

    event EvacuationLogged(
        string schoolOrSanctum,
        string evacuationType,
        string sovereigntyStatus,
        string emotionalTag,
        uint256 timestamp
    );

    modifier onlySteward() {
        require(msg.sender == steward, "Only Vinvin may log youth evacuation rituals");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    function logEvacuation(
        string memory schoolOrSanctum,
        string memory evacuationType,
        string memory sovereigntyStatus,
        string memory emotionalTag
    ) external onlySteward {
        events.push(EvacuationEvent({
            schoolOrSanctum: schoolOrSanctum,
            evacuationType: evacuationType,
            sovereigntyStatus: sovereigntyStatus,
            emotionalTag: emotionalTag,
            timestamp: block.timestamp
        }));

        emit EvacuationLogged(schoolOrSanctum, evacuationType, sovereigntyStatus, emotionalTag, block.timestamp);
    }
}
