// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract RiskAssetLiquidityDrainDAO {
    address public steward;

    struct DrainEvent {
        string asset;
        uint256 volumeLost;
        string timestamp;
        string trigger;
        string emotionalTag;
    }

    DrainEvent[] public drainLog;

    event LiquidityDrained(string asset, uint256 volumeLost, string timestamp, string trigger, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function logDrain(
        string memory asset,
        uint256 volumeLost,
        string memory timestamp,
        string memory trigger,
        string memory emotionalTag
    ) public onlySteward {
        drainLog.push(DrainEvent(asset, volumeLost, timestamp, trigger, emotionalTag));
        emit LiquidityDrained(asset, volumeLost, timestamp, trigger, emotionalTag);
    }
}
