// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PublicWelfareProtectionTreaty {
    address public steward;

    struct WelfareClause {
        string programName;
        string threatType;
        string protectionAction;
        string emotionalTag;
    }

    WelfareClause[] public treatyLog;

    event PublicWelfareProtected(string programName, string threatType, string protectionAction, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function protectWelfare(
        string memory programName,
        string memory threatType,
        string memory protectionAction,
        string memory emotionalTag
    ) public onlySteward {
        treatyLog.push(WelfareClause(programName, threatType, protectionAction, emotionalTag));
        emit PublicWelfareProtected(programName, threatType, protectionAction, emotionalTag);
    }
}
