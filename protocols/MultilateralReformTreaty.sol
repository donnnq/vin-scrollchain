// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MultilateralReformTreaty {
    address public steward;

    struct ReformClause {
        string institutionName;
        string reformDemand;
        string resistanceFactor;
        string emotionalTag;
    }

    ReformClause[] public treatyLog;

    event MultilateralReformTagged(string institutionName, string reformDemand, string resistanceFactor, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagReform(
        string memory institutionName,
        string memory reformDemand,
        string memory resistanceFactor,
        string memory emotionalTag
    ) public onlySteward {
        treatyLog.push(ReformClause(institutionName, reformDemand, resistanceFactor, emotionalTag));
        emit MultilateralReformTagged(institutionName, reformDemand, resistanceFactor, emotionalTag);
    }
}
