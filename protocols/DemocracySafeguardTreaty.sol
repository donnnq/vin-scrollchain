// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DemocracySafeguardTreaty {
    address public steward;

    struct SafeguardClause {
        string democraticProcess;
        string threatType;
        string safeguardAction;
        string emotionalTag;
    }

    SafeguardClause[] public treatyLog;

    event DemocracySafeguardTagged(string democraticProcess, string threatType, string safeguardAction, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagSafeguard(
        string memory democraticProcess,
        string memory threatType,
        string memory safeguardAction,
        string memory emotionalTag
    ) public onlySteward {
        treatyLog.push(SafeguardClause(democraticProcess, threatType, safeguardAction, emotionalTag));
        emit DemocracySafeguardTagged(democraticProcess, threatType, safeguardAction, emotionalTag);
    }
}
