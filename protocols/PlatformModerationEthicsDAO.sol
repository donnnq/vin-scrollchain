// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PlatformModerationEthicsDAO {
    address public steward;

    struct ModerationEntry {
        string platformName;
        string corridor;
        string moderationAction;
        string ethicalConcern;
        string emotionalTag;
    }

    ModerationEntry[] public registry;

    event ModerationTagged(string platformName, string corridor, string moderationAction, string ethicalConcern, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized: Not the steward");
        _;
    }

    function tagModeration(
        string memory platformName,
        string memory corridor,
        string memory moderationAction,
        string memory ethicalConcern,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(ModerationEntry(platformName, corridor, moderationAction, ethicalConcern, emotionalTag));
        emit ModerationTagged(platformName, corridor, moderationAction, ethicalConcern, emotionalTag);
    }
}
