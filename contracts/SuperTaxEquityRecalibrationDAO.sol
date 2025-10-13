// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract SuperTaxEquityRecalibrationDAO {
    address public steward;

    struct TierEvent {
        string balanceRange; // "$3M–$10M", "$10M–$20M", "Above $20M"
        uint256 taxRate;
        string emotionalTag;
        uint256 timestamp;
    }

    TierEvent[] public events;

    event TierLogged(
        string balanceRange,
        uint256 taxRate,
        string emotionalTag,
        uint256 timestamp
    );

    modifier onlySteward() {
        require(msg.sender == steward, "Only BatVin may log super tax tier rituals");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    function logTier(
        string memory balanceRange,
        uint256 taxRate,
        string memory emotionalTag
    ) external onlySteward {
        events.push(TierEvent({
            balanceRange: balanceRange,
            taxRate: taxRate,
            emotionalTag: emotionalTag,
            timestamp: block.timestamp
        }));

        emit TierLogged(balanceRange, taxRate, emotionalTag, block.timestamp);
    }

    function getTierByIndex(uint256 index) external view returns (
        string memory balanceRange,
        uint256 taxRate,
        string memory emotionalTag,
        uint256 timestamp
    ) {
        require(index < events.length, "Scrollstorm index out of bounds");
        TierEvent memory t = events[index];
        return (
            t.balanceRange,
            t.taxRate,
            t.emotionalTag,
            t.timestamp
        );
    }
}
