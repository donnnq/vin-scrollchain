// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract InvestorTraumaHealingDAO {
    address public steward;

    struct HealingEvent {
        string investorGroup;
        string traumaType; // "Crash Exposure", "Rug Pull", "Liquidity Loss"
        string healingAction; // "Counseling", "Rest Period", "Compensation"
        string emotionalTag;
        uint256 timestamp;
    }

    HealingEvent[] public events;

    event HealingLogged(
        string investorGroup,
        string traumaType,
        string healingAction,
        string emotionalTag,
        uint256 timestamp
    );

    modifier onlySteward() {
        require(msg.sender == steward, "Only BatVin may log investor healing rituals");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    function logHealing(
        string memory investorGroup,
        string memory traumaType,
        string memory healingAction,
        string memory emotionalTag
    ) external onlySteward {
        events.push(HealingEvent({
            investorGroup: investorGroup,
            traumaType: traumaType,
            healingAction: healingAction,
            emotionalTag: emotionalTag,
            timestamp: block.timestamp
        }));

        emit HealingLogged(investorGroup, traumaType, healingAction, emotionalTag, block.timestamp);
    }

    function getHealingByIndex(uint256 index) external view returns (
        string memory investorGroup,
        string memory traumaType,
        string memory healingAction,
        string memory emotionalTag,
        uint256 timestamp
    ) {
        require(index < events.length, "Scrollstorm index out of bounds");
        HealingEvent memory h = events[index];
        return (
            h.investorGroup,
            h.traumaType,
            h.healingAction,
            h.emotionalTag,
            h.timestamp
        );
    }
}
