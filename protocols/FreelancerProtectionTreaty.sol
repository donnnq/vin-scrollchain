// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FreelancerProtectionTreaty {
    address public steward;

    struct ProtectionClause {
        string freelancerName;
        string corridor;
        string protectionAction;
        string emotionalTag;
    }

    ProtectionClause[] public treatyLog;

    event FreelancerProtected(string freelancerName, string corridor, string protectionAction, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized: Not the steward");
        _;
    }

    function protectFreelancer(
        string memory freelancerName,
        string memory corridor,
        string memory protectionAction,
        string memory emotionalTag
    ) public onlySteward {
        treatyLog.push(ProtectionClause(freelancerName, corridor, protectionAction, emotionalTag));
        emit FreelancerProtected(freelancerName, corridor, protectionAction, emotionalTag);
    }
}
