// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DerivativesFundingRateDAO {
    address public steward;

    struct FundingRateEntry {
        string asset;
        int256 rate;
        string timestamp;
        string sentiment;
        string emotionalTag;
    }

    FundingRateEntry[] public rates;

    event FundingRateLogged(string asset, int256 rate, string timestamp, string sentiment, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function logFundingRate(
        string memory asset,
        int256 rate,
        string memory timestamp,
        string memory sentiment,
        string memory emotionalTag
    ) public onlySteward {
        rates.push(FundingRateEntry(asset, rate, timestamp, sentiment, emotionalTag));
        emit FundingRateLogged(asset, rate, timestamp, sentiment, emotionalTag);
    }
}
