// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract ParodyInflationAuditProtocolDAO {
    address public steward;

    struct InflationAudit {
        string region;
        string inflationTrigger; // "Supply Shock", "Wage Spiral", "Speculative Bubble"
        string parodyAction; // "Mock CPI Chart", "Satirical Press Briefing", "Animated Thread"
        string auditStatus; // "Amplified", "Flagged", "Neutralized"
        string emotionalTag;
        uint256 timestamp;
    }

    InflationAudit[] public events;

    event InflationLogged(
        string region,
        string inflationTrigger,
        string parodyAction,
        string auditStatus,
        string emotionalTag,
        uint256 timestamp
    );

    modifier onlySteward() {
        require(msg.sender == steward, "Only BatVin may log parody inflation audits");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    function logInflation(
        string memory region,
        string memory inflationTrigger,
        string memory parodyAction,
        string memory auditStatus,
        string memory emotionalTag
    ) external onlySteward {
        events.push(InflationAudit({
            region: region,
            inflationTrigger: inflationTrigger,
            parodyAction: parodyAction,
            auditStatus: auditStatus,
            emotionalTag: emotionalTag,
            timestamp: block.timestamp
        }));

        emit InflationLogged(region, inflationTrigger, parodyAction, auditStatus, emotionalTag, block.timestamp);
    }

    function getInflationByIndex(uint256 index) external view returns (
        string memory region,
        string memory inflationTrigger,
        string memory parodyAction,
        string memory auditStatus,
        string memory emotionalTag,
        uint256 timestamp
    ) {
        require(index < events.length, "Scrollstorm index out of bounds");
        InflationAudit memory i = events[index];
        return (
            i.region,
            i.inflationTrigger,
            i.parodyAction,
            i.auditStatus,
            i.emotionalTag,
            i.timestamp
        );
    }
}
