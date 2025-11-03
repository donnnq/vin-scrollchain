// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract HumanitarianSafeguardTreaty {
    address public steward;

    struct SafeguardClause {
        string aidProgram;
        string threatType;
        string safeguardAction;
        string emotionalTag;
    }

    SafeguardClause[] public treatyLog;

    event HumanitarianSafeguardTagged(string aidProgram, string threatType, string safeguardAction, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagSafeguard(
        string memory aidProgram,
        string memory threatType,
        string memory safeguardAction,
        string memory emotionalTag
    ) public onlySteward {
        treatyLog.push(SafeguardClause(aidProgram, threatType, safeguardAction, emotionalTag));
        emit HumanitarianSafeguardTagged(aidProgram, threatType, safeguardAction, emotionalTag);
    }
}
