// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ETFOutflowSentimentIndex {
    address public steward;

    struct ETFSignal {
        string fundName;
        uint256 outflowAmount;
        string date;
        string sentiment;
        string assetClass;
    }

    ETFSignal[] public index;

    event ETFOutflowLogged(string fundName, uint256 outflowAmount, string date, string sentiment, string assetClass);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function logOutflow(
        string memory fundName,
        uint256 outflowAmount,
        string memory date,
        string memory sentiment,
        string memory assetClass
    ) public onlySteward {
        index.push(ETFSignal(fundName, outflowAmount, date, sentiment, assetClass));
        emit ETFOutflowLogged(fundName, outflowAmount, date, sentiment, assetClass);
    }
}
