// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract EmotionalTaggingReformIndex {
    address public steward;

    struct ReformEntry {
        string timestamp;
        string reformTitle;
        string policyArea;
        string emotionalTag;
        string civicResonance;
    }

    ReformEntry[] public index;

    event ReformEmotionallyTagged(string timestamp, string reformTitle, string policyArea, string emotionalTag, string civicResonance);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagReform(
        string memory timestamp,
        string memory reformTitle,
        string memory policyArea,
        string memory emotionalTag,
        string memory civicResonance
    ) public onlySteward {
        index.push(ReformEntry(timestamp, reformTitle, policyArea, emotionalTag, civicResonance));
        emit ReformEmotionallyTagged(timestamp, reformTitle, policyArea, emotionalTag, civicResonance);
    }
}
