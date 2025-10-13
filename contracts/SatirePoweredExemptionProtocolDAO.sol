// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract SatirePoweredExemptionProtocolDAO {
    address public steward;

    struct ExemptionEvent {
        string memeTitle;
        string policyThreat; // "Call Center Bill", "Tariff Expansion"
        string satireType; // "Mock Hearing", "Animated Thread", "Parody Speech"
        string exemptionOutcome; // "Granted", "Pending", "Denied"
        string emotionalTag;
        uint256 timestamp;
    }

    ExemptionEvent[] public events;

    event ExemptionLogged(
        string memeTitle,
        string policyThreat,
        string satireType,
        string exemptionOutcome,
        string emotionalTag,
        uint256 timestamp
    );

    modifier onlySteward() {
        require(msg.sender == steward, "Only BatVin may log satire-powered exemption rituals");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    function logExemption(
        string memory memeTitle,
        string memory policyThreat,
        string memory satireType,
        string memory exemptionOutcome,
        string memory emotionalTag
    ) external onlySteward {
        events.push(ExemptionEvent({
            memeTitle: memeTitle,
            policyThreat: policyThreat,
            satireType: satireType,
            exemptionOutcome: exemptionOutcome,
            emotionalTag: emotionalTag,
            timestamp: block.timestamp
        }));

        emit ExemptionLogged(memeTitle, policyThreat, satireType, exemptionOutcome, emotionalTag, block.timestamp);
    }

    function getExemptionByIndex(uint256 index) external view returns (
        string memory memeTitle,
        string memory policyThreat,
        string memory satireType,
        string memory exemptionOutcome,
        string memory emotionalTag,
        uint256 timestamp
    ) {
        require(index < events.length, "Scrollstorm index out of bounds");
        ExemptionEvent memory e = events[index];
        return (
            e.memeTitle,
            e.policyThreat,
            e.satireType,
            e.exemptionOutcome,
            e.emotionalTag,
            e.timestamp
        );
    }
}
