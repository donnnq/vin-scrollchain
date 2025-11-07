// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CryptoMacroCorrelationTracker {
    address public steward;

    struct CorrelationEntry {
        string cryptoAsset;
        string macroAsset;
        int256 correlationCoefficient;
        string timeframe;
        string timestamp;
    }

    CorrelationEntry[] public tracker;

    event CorrelationLogged(string cryptoAsset, string macroAsset, int256 correlationCoefficient, string timeframe, string timestamp);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function logCorrelation(
        string memory cryptoAsset,
        string memory macroAsset,
        int256 correlationCoefficient,
        string memory timeframe,
        string memory timestamp
    ) public onlySteward {
        tracker.push(CorrelationEntry(cryptoAsset, macroAsset, correlationCoefficient, timeframe, timestamp));
        emit CorrelationLogged(cryptoAsset, macroAsset, correlationCoefficient, timeframe, timestamp);
    }
}
