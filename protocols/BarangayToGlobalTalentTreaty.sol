// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BarangayToGlobalTalentTreaty {
    address public steward;

    struct TalentClause {
        string residentName;
        string globalPlatform;
        string talentVerdict;
        string emotionalTag;
    }

    TalentClause[] public treatyLog;

    event GlobalTalentTagged(string residentName, string globalPlatform, string talentVerdict, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagGlobalTalent(
        string memory residentName,
        string memory globalPlatform,
        string memory talentVerdict,
        string memory emotionalTag
    ) public onlySteward {
        treatyLog.push(TalentClause(residentName, globalPlatform, talentVerdict, emotionalTag));
        emit GlobalTalentTagged(residentName, globalPlatform, talentVerdict, emotionalTag);
    }
}
