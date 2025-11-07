// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DisinformationImpactSentimentIndex {
    address public steward;

    struct ImpactEntry {
        string barangay;
        string timestamp;
        string disinfoSource;
        uint256 emotionalImpactScore;
        string civicDamageAssessment;
        string emotionalTag;
    }

    ImpactEntry[] public index;

    event DisinformationImpactLogged(string barangay, string timestamp, string disinfoSource, uint256 emotionalImpactScore, string civicDamageAssessment, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function logImpact(
        string memory barangay,
        string memory timestamp,
        string memory disinfoSource,
        uint256 emotionalImpactScore,
        string memory civicDamageAssessment,
        string memory emotionalTag
    ) public onlySteward {
        index.push(ImpactEntry(barangay, timestamp, disinfoSource, emotionalImpactScore, civicDamageAssessment, emotionalTag));
        emit DisinformationImpactLogged(barangay, timestamp, disinfoSource, emotionalImpactScore, civicDamageAssessment, emotionalTag);
    }
}
