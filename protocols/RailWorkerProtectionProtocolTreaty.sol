// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract RailWorkerProtectionProtocolTreaty {
    address public steward;

    struct ProtectionClause {
        string unionName;
        string corridor;
        string protectionAction;
        string emotionalTag;
    }

    ProtectionClause[] public treatyLog;

    event ProtectionTagged(string unionName, string corridor, string protectionAction, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized: Not the steward");
        _;
    }

    function tagProtection(
        string memory unionName,
        string memory corridor,
        string memory protectionAction,
        string memory emotionalTag
    ) public onlySteward {
        treatyLog.push(ProtectionClause(unionName, corridor, protectionAction, emotionalTag));
        emit ProtectionTagged(unionName, corridor, protectionAction, emotionalTag);
    }
}
