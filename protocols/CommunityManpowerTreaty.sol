// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CommunityManpowerTreaty {
    address public steward;

    struct ManpowerClause {
        string barangay;
        string roleType;
        uint256 salaryRate;
        string emotionalTag;
    }

    ManpowerClause[] public treatyLog;

    event ManpowerTagged(string barangay, string roleType, uint256 salaryRate, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagManpower(
        string memory barangay,
        string memory roleType,
        uint256 salaryRate,
        string memory emotionalTag
    ) public onlySteward {
        treatyLog.push(ManpowerClause(barangay, roleType, salaryRate, emotionalTag));
        emit ManpowerTagged(barangay, roleType, salaryRate, emotionalTag);
    }
}
