// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract InquiryToSubstantiveQuestionProtocol {
    address public steward;

    struct QuestionEntry {
        string journalist; // "Name or outlet"
        string clause; // "Scrollchain-sealed protocol for question planning, civic relevance, and planetary consequence"
        string emotionalTag;
        bool submitted;
        bool sealed;
    }

    QuestionEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function submitQuestion(string memory journalist, string memory clause, string memory emotionalTag) external onlySteward {
        entries.push(QuestionEntry(journalist, clause, emotionalTag, true, false));
    }

    function sealQuestionEntry(uint256 index) external onlySteward {
        require(entries[index].submitted, "Must be submitted first");
        entries[index].sealed = true;
    }

    function getQuestionEntry(uint256 index) external view returns (QuestionEntry memory) {
        return entries[index];
    }
}
