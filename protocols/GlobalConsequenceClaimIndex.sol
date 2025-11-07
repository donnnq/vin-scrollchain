// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract GlobalConsequenceClaimIndex {
    address public steward;

    struct ClaimEntry {
        string timestamp;
        string eventTitle;
        string claimSource;
        string exaggerationLevel;
        string verifiedImpact;
        string emotionalTag;
    }

    ClaimEntry[] public index;

    event GlobalClaimIndexed(string timestamp, string eventTitle, string claimSource, string exaggerationLevel, string verifiedImpact, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function indexClaim(
        string memory timestamp,
        string memory eventTitle,
        string memory claimSource,
        string memory exaggerationLevel,
        string memory verifiedImpact,
        string memory emotionalTag
    ) public onlySteward {
        index.push(ClaimEntry(timestamp, eventTitle, claimSource, exaggerationLevel, verifiedImpact, emotionalTag));
        emit GlobalClaimIndexed(timestamp, eventTitle, claimSource, exaggerationLevel, verifiedImpact, emotionalTag);
    }
}
