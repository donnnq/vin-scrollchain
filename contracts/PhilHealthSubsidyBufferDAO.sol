// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract PhilHealthSubsidyBufferDAO {
    address public steward;

    struct SubsidyEvent {
        string beneficiaryGroup; // "Indigent", "Senior", "PWD"
        uint256 subsidyAmount;
        string bufferTrigger; // "Budget Realignment", "Health Crisis", "Premium Spike"
        string emotionalTag;
        uint256 timestamp;
    }

    SubsidyEvent[] public events;

    event SubsidyLogged(
        string beneficiaryGroup,
        uint256 subsidyAmount,
        string bufferTrigger,
        string emotionalTag,
        uint256 timestamp
    );

    modifier onlySteward() {
        require(msg.sender == steward, "Only BatVin may log PhilHealth subsidy rituals");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    function logSubsidy(
        string memory beneficiaryGroup,
        uint256 subsidyAmount,
        string memory bufferTrigger,
        string memory emotionalTag
    ) external onlySteward {
        events.push(SubsidyEvent({
            beneficiaryGroup: beneficiaryGroup,
            subsidyAmount: subsidyAmount,
            bufferTrigger: bufferTrigger,
            emotionalTag: emotionalTag,
            timestamp: block.timestamp
        }));

        emit SubsidyLogged(beneficiaryGroup, subsidyAmount, bufferTrigger, emotionalTag, block.timestamp);
    }

    function getSubsidyByIndex(uint256 index) external view returns (
        string memory beneficiaryGroup,
        uint256 subsidyAmount,
        string memory bufferTrigger,
        string memory emotionalTag,
        uint256 timestamp
    ) {
        require(index < events.length, "Scrollstorm index out of bounds");
        SubsidyEvent memory s = events[index];
        return (
            s.beneficiaryGroup,
            s.subsidyAmount,
            s.bufferTrigger,
            s.emotionalTag,
            s.timestamp
        );
    }
}
