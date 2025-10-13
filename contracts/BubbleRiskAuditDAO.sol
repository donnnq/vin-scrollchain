// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract BubbleRiskAuditDAO {
    address public steward;

    struct BubbleEvent {
        string sector; // "AI", "Tech", "Equities"
        string riskSignal; // "Overvaluation", "Speculation", "Liquidity Stress"
        string auditStatus; // "Emerging", "Critical", "Popped"
        string emotionalTag;
        uint256 timestamp;
    }

    BubbleEvent[] public events;

    event BubbleLogged(
        string sector,
        string riskSignal,
        string auditStatus,
        string emotionalTag,
        uint256 timestamp
    );

    modifier onlySteward() {
        require(msg.sender == steward, "Only BatVin may log bubble risk rituals");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    function logBubble(
        string memory sector,
        string memory riskSignal,
        string memory auditStatus,
        string memory emotionalTag
    ) external onlySteward {
        events.push(BubbleEvent({
            sector: sector,
            riskSignal: riskSignal,
            auditStatus: auditStatus,
            emotionalTag: emotionalTag,
            timestamp: block.timestamp
        }));

        emit BubbleLogged(sector, riskSignal, auditStatus, emotionalTag, block.timestamp);
    }

    function getBubbleByIndex(uint256 index) external view returns (
        string memory sector,
        string memory riskSignal,
        string memory auditStatus,
        string memory emotionalTag,
        uint256 timestamp
    ) {
        require(index < events.length, "Scrollstorm index out of bounds");
        BubbleEvent memory b = events[index];
        return (
            b.sector,
            b.riskSignal,
            b.auditStatus,
            b.emotionalTag,
            b.timestamp
        );
    }
}
