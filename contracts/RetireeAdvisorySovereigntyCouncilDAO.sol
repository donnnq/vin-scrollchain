// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract RetireeAdvisorySovereigntyCouncilDAO {
    address public steward;

    struct CouncilEvent {
        string stakeholderGroup; // "Retirees", "Accountants", "Farm Owners"
        string advisoryTopic; // "Tax Reform", "Offset Indexation", "Asset Liquidity"
        string councilStatus; // "Consulted", "Pending", "Ignored"
        string emotionalTag;
        uint256 timestamp;
    }

    CouncilEvent[] public events;

    event CouncilLogged(
        string stakeholderGroup,
        string advisoryTopic,
        string councilStatus,
        string emotionalTag,
        uint256 timestamp
    );

    modifier onlySteward() {
        require(msg.sender == steward, "Only BatVin may log retiree advisory rituals");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    function logCouncil(
        string memory stakeholderGroup,
        string memory advisoryTopic,
        string memory councilStatus,
        string memory emotionalTag
    ) external onlySteward {
        events.push(CouncilEvent({
            stakeholderGroup: stakeholderGroup,
            advisoryTopic: advisoryTopic,
            councilStatus: councilStatus,
            emotionalTag: emotionalTag,
            timestamp: block.timestamp
        }));

        emit CouncilLogged(stakeholderGroup, advisoryTopic, councilStatus, emotionalTag, block.timestamp);
    }

    function getCouncilByIndex(uint256 index) external view returns (
        string memory stakeholderGroup,
        string memory advisoryTopic,
        string memory councilStatus,
        string memory emotionalTag,
        uint256 timestamp
    ) {
        require(index < events.length, "Scrollstorm index out of bounds");
        CouncilEvent memory c = events[index];
        return (
            c.stakeholderGroup,
            c.advisoryTopic,
            c.councilStatus,
            c.emotionalTag,
            c.timestamp
        );
    }
}
