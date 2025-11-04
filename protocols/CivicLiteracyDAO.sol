// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CivicLiteracyDAO {
    address public steward;

    struct LearningGrant {
        string community;
        string learningFocus;
        string fundingMechanism;
        string emotionalTag;
    }

    LearningGrant[] public registry;

    event CivicLiteracyFunded(string community, string learningFocus, string fundingMechanism, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function fundLiteracy(
        string memory community,
        string memory learningFocus,
        string memory fundingMechanism,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(LearningGrant(community, learningFocus, fundingMechanism, emotionalTag));
        emit CivicLiteracyFunded(community, learningFocus, fundingMechanism, emotionalTag);
    }
}
