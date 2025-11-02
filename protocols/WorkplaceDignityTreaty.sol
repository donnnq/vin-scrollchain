// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract WorkplaceDignityTreaty {
    address public steward;

    struct DignityClause {
        string workplaceZone;
        string dignityViolation;
        string restorationAction;
        string emotionalTag;
    }

    DignityClause[] public treatyLog;

    event WorkplaceDignityTagged(string workplaceZone, string dignityViolation, string restorationAction, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagDignity(
        string memory workplaceZone,
        string memory dignityViolation,
        string memory restorationAction,
        string memory emotionalTag
    ) public onlySteward {
        treatyLog.push(DignityClause(workplaceZone, dignityViolation, restorationAction, emotionalTag));
        emit WorkplaceDignityTagged(workplaceZone, dignityViolation, restorationAction, emotionalTag);
    }
}
