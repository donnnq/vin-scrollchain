// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract RogueJudgeContainmentProtocol {
    address public steward;

    struct ContainmentEntry {
        string timestamp;
        string judgeName;
        string resistanceAction;
        string executiveResponse;
        string ruleOfLawTensionLevel;
        string emotionalTag;
    }

    ContainmentEntry[] public protocol;

    event RogueJudgeContained(string timestamp, string judgeName, string resistanceAction, string executiveResponse, string ruleOfLawTensionLevel, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function containJudge(
        string memory timestamp,
        string memory judgeName,
        string memory resistanceAction,
        string memory executiveResponse,
        string memory ruleOfLawTensionLevel,
        string memory emotionalTag
    ) public onlySteward {
        protocol.push(ContainmentEntry(timestamp, judgeName, resistanceAction, executiveResponse, ruleOfLawTensionLevel, emotionalTag));
        emit RogueJudgeContained(timestamp, judgeName, resistanceAction, executiveResponse, ruleOfLawTensionLevel, emotionalTag);
    }
}
