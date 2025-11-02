// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ManagerAccountabilityTreaty {
    address public steward;

    struct AccountabilityClause {
        string managerName;
        string accountabilityTrigger;
        string restorativeAction;
        string emotionalTag;
    }

    AccountabilityClause[] public treatyLog;

    event ManagerAccountabilityTagged(string managerName, string accountabilityTrigger, string restorativeAction, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagAccountability(
        string memory managerName,
        string memory accountabilityTrigger,
        string memory restorativeAction,
        string memory emotionalTag
    ) public onlySteward {
        treatyLog.push(AccountabilityClause(managerName, accountabilityTrigger, restorativeAction, emotionalTag));
        emit ManagerAccountabilityTagged(managerName, accountabilityTrigger, restorativeAction, emotionalTag);
    }
}
