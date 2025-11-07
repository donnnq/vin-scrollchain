// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract RiskAssetReentryManifest {
    address public steward;

    struct ReentryEvent {
        string asset;
        string traderID;
        string timestamp;
        string reentryStrategy;
        string emotionalTag;
    }

    ReentryEvent[] public manifest;

    event RiskAssetReentered(string asset, string traderID, string timestamp, string reentryStrategy, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function logReentry(
        string memory asset,
        string memory traderID,
        string memory timestamp,
        string memory reentryStrategy,
        string memory emotionalTag
    ) public onlySteward {
        manifest.push(ReentryEvent(asset, traderID, timestamp, reentryStrategy, emotionalTag));
        emit RiskAssetReentered(asset, traderID, timestamp, reentryStrategy, emotionalTag);
    }
}
