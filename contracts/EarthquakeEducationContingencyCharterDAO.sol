// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract EarthquakeEducationContingencyCharterDAO {
    address public steward;

    struct ContingencyEvent {
        string region; // "Bulacan", "Laguna", "Cebu"
        string contingencyType; // "Online Shift", "Safety Drill", "Infrastructure Audit"
        string emotionalTag;
        uint256 timestamp;
    }

    ContingencyEvent[] public events;

    event ContingencyLogged(
        string region,
        string contingencyType,
        string emotionalTag,
        uint256 timestamp
    );

    modifier onlySteward() {
        require(msg.sender == steward, "Only Vinvin may log education contingency rituals");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    function logContingency(
        string memory region,
        string memory contingencyType,
        string memory emotionalTag
    ) external onlySteward {
        events.push(ContingencyEvent({
            region: region,
            contingencyType: contingencyType,
            emotionalTag: emotionalTag,
            timestamp: block.timestamp
        }));

        emit ContingencyLogged(region, contingencyType, emotionalTag, block.timestamp);
    }
}
