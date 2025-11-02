// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MuseumOfRemixConsequenceTreaty {
    address public steward;

    struct RemixClause {
        string modTitle;
        string archivalStatus;
        string legacyImpact;
        string emotionalTag;
    }

    RemixClause[] public treatyLog;

    event RemixConsequenceTagged(string modTitle, string archivalStatus, string legacyImpact, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagRemixConsequence(
        string memory modTitle,
        string memory archivalStatus,
        string memory legacyImpact,
        string memory emotionalTag
    ) public onlySteward {
        treatyLog.push(RemixClause(modTitle, archivalStatus, legacyImpact, emotionalTag));
        emit RemixConsequenceTagged(modTitle, archivalStatus, legacyImpact, emotionalTag);
    }
}
