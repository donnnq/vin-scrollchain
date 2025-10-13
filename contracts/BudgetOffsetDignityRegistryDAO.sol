// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract BudgetOffsetDignityRegistryDAO {
    address public steward;

    struct RegistryEvent {
        string offsetType; // "Low-Income Super", "Healthcare Subsidy", "Pension Rebate"
        string dignityClause; // "Indexation Guarantee", "Eligibility Expansion", "Transparency Mandate"
        string registryStatus; // "Ratified", "Pending", "Violated"
        string emotionalTag;
        uint256 timestamp;
    }

    RegistryEvent[] public events;

    event RegistryLogged(
        string offsetType,
        string dignityClause,
        string registryStatus,
        string emotionalTag,
        uint256 timestamp
    );

    modifier onlySteward() {
        require(msg.sender == steward, "Only BatVin may log budget offset dignity rituals");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    function logRegistry(
        string memory offsetType,
        string memory dignityClause,
        string memory registryStatus,
        string memory emotionalTag
    ) external onlySteward {
        events.push(RegistryEvent({
            offsetType: offsetType,
            dignityClause: dignityClause,
            registryStatus: registryStatus,
            emotionalTag: emotionalTag,
            timestamp: block.timestamp
        }));

        emit RegistryLogged(offsetType, dignityClause, registryStatus, emotionalTag, block.timestamp);
    }

    function getRegistryByIndex(uint256 index) external view returns (
        string memory offsetType,
        string memory dignityClause,
        string memory registryStatus,
        string memory emotionalTag,
        uint256 timestamp
    ) {
        require(index < events.length, "Scrollstorm index out of bounds");
        RegistryEvent memory r = events[index];
        return (
            r.offsetType,
            r.dignityClause,
            r.registryStatus,
            r.emotionalTag,
            r.timestamp
        );
    }
}
