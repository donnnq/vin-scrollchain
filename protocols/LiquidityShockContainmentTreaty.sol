// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract LiquidityShockContainmentTreaty {
    address public steward;

    struct ShockEvent {
        string asset;
        uint256 volumeLost;
        string timestamp;
        string trigger;
        string containmentAction;
        string emotionalTag;
    }

    ShockEvent[] public treaty;

    event LiquidityShockContained(string asset, uint256 volumeLost, string timestamp, string trigger, string containmentAction, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function containShock(
        string memory asset,
        uint256 volumeLost,
        string memory timestamp,
        string memory trigger,
        string memory containmentAction,
        string memory emotionalTag
    ) public onlySteward {
        treaty.push(ShockEvent(asset, volumeLost, timestamp, trigger, containmentAction, emotionalTag));
        emit LiquidityShockContained(asset, volumeLost, timestamp, trigger, containmentAction, emotionalTag);
    }
}
