// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract EmergencyReliefTreaty {
    address public steward;

    struct ReliefClause {
        string crisisType;
        string reliefDelay;
        string restorationAction;
        string emotionalTag;
    }

    ReliefClause[] public treatyLog;

    event EmergencyReliefTagged(string crisisType, string reliefDelay, string restorationAction, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagRelief(
        string memory crisisType,
        string memory reliefDelay,
        string memory restorationAction,
        string memory emotionalTag
    ) public onlySteward {
        treatyLog.push(ReliefClause(crisisType, reliefDelay, restorationAction, emotionalTag));
        emit EmergencyReliefTagged(crisisType, reliefDelay, restorationAction, emotionalTag);
    }
}
