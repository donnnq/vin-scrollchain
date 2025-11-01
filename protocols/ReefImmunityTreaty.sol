// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ReefImmunityTreaty {
    address public steward;

    struct ImmunityClause {
        string reefZone;
        string clauseID;
        string protectionType;
        string emotionalTag;
    }

    ImmunityClause[] public treatyLog;

    event ImmunityGranted(string reefZone, string clauseID, string protectionType, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized: Not the steward");
        _;
    }

    function grantImmunity(
        string memory reefZone,
        string memory clauseID,
        string memory protectionType,
        string memory emotionalTag
    ) public onlySteward {
        treatyLog.push(ImmunityClause(reefZone, clauseID, protectionType, emotionalTag));
        emit ImmunityGranted(reefZone, clauseID, protectionType, emotionalTag);
    }
}
