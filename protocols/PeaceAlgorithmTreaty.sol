// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PeaceAlgorithmTreaty {
    address public steward;

    struct AlgorithmClause {
        string AIModel;
        string conflictPrediction;
        string peaceDirective;
        string emotionalTag;
    }

    AlgorithmClause[] public treatyLog;

    event PeaceAlgorithmTagged(string AIModel, string conflictPrediction, string peaceDirective, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagPeace(
        string memory AIModel,
        string memory conflictPrediction,
        string memory peaceDirective,
        string memory emotionalTag
    ) public onlySteward {
        treatyLog.push(AlgorithmClause(AIModel, conflictPrediction, peaceDirective, emotionalTag));
        emit PeaceAlgorithmTagged(AIModel, conflictPrediction, peaceDirective, emotionalTag);
    }
}
