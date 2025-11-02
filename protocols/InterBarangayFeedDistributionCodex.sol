// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract InterBarangayFeedDistributionCodex {
    address public steward;

    struct FeedClause {
        string sourceBarangay;
        string recipientBarangay;
        string feedType;
        string emotionalTag;
    }

    FeedClause[] public codex;

    event FeedDistributed(string sourceBarangay, string recipientBarangay, string feedType, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function distributeFeed(
        string memory sourceBarangay,
        string memory recipientBarangay,
        string memory feedType,
        string memory emotionalTag
    ) public onlySteward {
        codex.push(FeedClause(sourceBarangay, recipientBarangay, feedType, emotionalTag));
        emit FeedDistributed(sourceBarangay, recipientBarangay, feedType, emotionalTag);
    }
}
