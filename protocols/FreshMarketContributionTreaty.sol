// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FreshMarketContributionTreaty {
    address public steward;

    struct MarketClause {
        string farmLocation;
        string produceType;
        string distributionChannel;
        string emotionalTag;
    }

    MarketClause[] public treatyLog;

    event MarketContributionTagged(string farmLocation, string produceType, string distributionChannel, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized: Not the steward");
        _;
    }

    function tagMarketContribution(
        string memory farmLocation,
        string memory produceType,
        string memory distributionChannel,
        string memory emotionalTag
    ) public onlySteward {
        treatyLog.push(MarketClause(farmLocation, produceType, distributionChannel, emotionalTag));
        emit MarketContributionTagged(farmLocation, produceType, distributionChannel, emotionalTag);
    }
}
