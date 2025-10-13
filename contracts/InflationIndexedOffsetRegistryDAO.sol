// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract InflationIndexedOffsetRegistryDAO {
    address public steward;

    struct OffsetEvent {
        string offsetType; // "Low-Income Super", "Pension Rebate", "Healthcare Subsidy"
        uint256 baseAmount;
        string indexMethod; // "CPI", "Wage Growth", "Custom Formula"
        string offsetStatus; // "Ratified", "Pending", "Violated"
        string emotionalTag;
        uint256 timestamp;
    }

    OffsetEvent[] public events;

    event OffsetLogged(
        string offsetType,
        uint256 baseAmount,
        string indexMethod,
        string offsetStatus,
        string emotionalTag,
        uint256 timestamp
    );

    modifier onlySteward() {
        require(msg.sender == steward, "Only BatVin may log inflation-indexed offset rituals");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    function logOffset(
        string memory offsetType,
        uint256 baseAmount,
        string memory indexMethod,
        string memory offsetStatus,
        string memory emotionalTag
    ) external onlySteward {
        events.push(OffsetEvent({
            offsetType: offsetType,
            baseAmount: baseAmount,
            indexMethod: indexMethod,
            offsetStatus: offsetStatus,
            emotionalTag: emotionalTag,
            timestamp: block.timestamp
        }));

        emit OffsetLogged(offsetType, baseAmount, indexMethod, offsetStatus, emotionalTag, block.timestamp);
    }

    function getOffsetByIndex(uint256 index) external view returns (
        string memory offsetType,
        uint256 baseAmount,
        string memory indexMethod,
        string memory offsetStatus,
        string memory emotionalTag,
        uint256 timestamp
    ) {
        require(index < events.length, "Scrollstorm index out of bounds");
        OffsetEvent memory o = events[index];
        return (
            o.offsetType,
            o.baseAmount,
            o.indexMethod,
            o.offsetStatus,
            o.emotionalTag,
            o.timestamp
        );
    }
}
