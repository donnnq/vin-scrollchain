// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract UserProtectionTreaty {
    address public steward;

    struct ProtectionClause {
        string userGroup;
        string modAccessRight;
        string restrictionTrigger;
        string emotionalTag;
    }

    ProtectionClause[] public treatyLog;

    event UserProtectionTagged(string userGroup, string modAccessRight, string restrictionTrigger, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagProtection(
        string memory userGroup,
        string memory modAccessRight,
        string memory restrictionTrigger,
        string memory emotionalTag
    ) public onlySteward {
        treatyLog.push(ProtectionClause(userGroup, modAccessRight, restrictionTrigger, emotionalTag));
        emit UserProtectionTagged(userGroup, modAccessRight, restrictionTrigger, emotionalTag);
    }
}
