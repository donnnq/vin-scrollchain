// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MajorQuestionsDoctrineIndex {
    address public steward;

    struct DoctrineEntry {
        string caseName;
        string executiveClaim;
        string congressionalSignal;
        string emotionalTag;
    }

    DoctrineEntry[] public index;

    event MajorQuestionTagged(string caseName, string executiveClaim, string congressionalSignal, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagDoctrine(
        string memory caseName,
        string memory executiveClaim,
        string memory congressionalSignal,
        string memory emotionalTag
    ) public onlySteward {
        index.push(DoctrineEntry(caseName, executiveClaim, congressionalSignal, emotionalTag));
        emit MajorQuestionTagged(caseName, executiveClaim, congressionalSignal, emotionalTag);
    }
}
