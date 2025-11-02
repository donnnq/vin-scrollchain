// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CrewResilienceDAO {
    address public steward;

    struct ResilienceEntry {
        string crewName;
        string challengeFaced;
        string recoveryAction;
        string emotionalTag;
    }

    ResilienceEntry[] public registry;

    event CrewResilienceTagged(string crewName, string challengeFaced, string recoveryAction, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagResilience(
        string memory crewName,
        string memory challengeFaced,
        string memory recoveryAction,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(ResilienceEntry(crewName, challengeFaced, recoveryAction, emotionalTag));
        emit CrewResilienceTagged(crewName, challengeFaced, recoveryAction, emotionalTag);
    }
}
