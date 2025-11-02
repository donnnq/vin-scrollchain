// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract InfrastructureKarmaTribunalDAO {
    address public steward;

    struct TribunalEntry {
        string projectName;
        string corridor;
        string karmaVerdict;
        string emotionalTag;
    }

    TribunalEntry[] public registry;

    event KarmaJudged(string projectName, string corridor, string karmaVerdict, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized: Not the steward");
        _;
    }

    function judgeKarma(
        string memory projectName,
        string memory corridor,
        string memory karmaVerdict,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(TribunalEntry(projectName, corridor, karmaVerdict, emotionalTag));
        emit KarmaJudged(projectName, corridor, karmaVerdict, emotionalTag);
    }
}
