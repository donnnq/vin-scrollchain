// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FloodControlKarmaTribunalDAO {
    address public steward;

    struct TribunalEntry {
        string officialName;
        string project;
        string anomalyType;
        string karmaVerdict;
        string emotionalTag;
    }

    TribunalEntry[] public registry;

    event KarmaJudged(string officialName, string project, string anomalyType, string karmaVerdict, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized: Not the steward");
        _;
    }

    function judgeKarma(
        string memory officialName,
        string memory project,
        string memory anomalyType,
        string memory karmaVerdict,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(TribunalEntry(officialName, project, anomalyType, karmaVerdict, emotionalTag));
        emit KarmaJudged(officialName, project, anomalyType, karmaVerdict, emotionalTag);
    }
}
