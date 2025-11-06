// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract EVBatterySafetyImmunityTreaty {
    address public steward;

    struct SafetyClause {
        string manufacturer;
        string batteryType;
        string immunityProtocol;
        string emotionalTag;
    }

    SafetyClause[] public treatyLog;

    event EVBatterySafetyTagged(string manufacturer, string batteryType, string immunityProtocol, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagSafety(
        string memory manufacturer,
        string memory batteryType,
        string memory immunityProtocol,
        string memory emotionalTag
    ) public onlySteward {
        treatyLog.push(SafetyClause(manufacturer, batteryType, immunityProtocol, emotionalTag));
        emit EVBatterySafetyTagged(manufacturer, batteryType, immunityProtocol, emotionalTag);
    }
}
