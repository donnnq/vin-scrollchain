// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TeacherAILiteracyCodex {
    address public steward;

    struct LiteracyEntry {
        string region;
        string AIConcept;
        string trainingMechanism;
        string emotionalTag;
    }

    LiteracyEntry[] public codex;

    event AILiteracyTagged(string region, string AIConcept, string trainingMechanism, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagLiteracy(
        string memory region,
        string memory AIConcept,
        string memory trainingMechanism,
        string memory emotionalTag
    ) public onlySteward {
        codex.push(LiteracyEntry(region, AIConcept, trainingMechanism, emotionalTag));
        emit AILiteracyTagged(region, AIConcept, trainingMechanism, emotionalTag);
    }
}
