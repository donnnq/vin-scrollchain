// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract UnderwaterAIOverrideLedger {
    address public steward;

    struct OverrideEvent {
        string aiUnitID;
        string overrideCode;
        string timestamp;
        string triggerCondition;
        string emotionalTag;
    }

    OverrideEvent[] public ledger;

    event AIOverrideLogged(string aiUnitID, string overrideCode, string timestamp, string triggerCondition, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function logOverride(
        string memory aiUnitID,
        string memory overrideCode,
        string memory timestamp,
        string memory triggerCondition,
        string memory emotionalTag
    ) public onlySteward {
        ledger.push(OverrideEvent(aiUnitID, overrideCode, timestamp, triggerCondition, emotionalTag));
        emit AIOverrideLogged(aiUnitID, overrideCode, timestamp, triggerCondition, emotionalTag);
    }
}
