// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BarangayToBuyerFeedbackEquityTreaty {
    address public steward;

    struct FeedbackClause {
        string originBarangay;
        string buyerLocation;
        string feedbackProtocol;
        string emotionalTag;
    }

    FeedbackClause[] public treatyLog;

    event FeedbackEquityTagged(string originBarangay, string buyerLocation, string feedbackProtocol, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagFeedbackEquity(
        string memory originBarangay,
        string memory buyerLocation,
        string memory feedbackProtocol,
        string memory emotionalTag
    ) public onlySteward {
        treatyLog.push(FeedbackClause(originBarangay, buyerLocation, feedbackProtocol, emotionalTag));
        emit FeedbackEquityTagged(originBarangay, buyerLocation, feedbackProtocol, emotionalTag);
    }
}
