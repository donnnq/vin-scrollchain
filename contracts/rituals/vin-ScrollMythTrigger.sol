// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title VINVIN’s Myth Trigger
/// @notice Fires lore arcs when on-chain conditions are met

contract vin_scrollMythTrigger {
    enum Condition { Balance, BlockHeight, SigilCount }

    struct Arc {
        Condition cond;
        address target;
        uint256 threshold;
        string story;
        bool fired;
    }

    Arc[] public arcs;

    event MythArcFired(uint256 indexed arcId, address target, string story);

    function addArc(
        Condition cond,
        address target,
        uint256 threshold,
        string calldata story
    ) external {
        arcs.push(Arc(cond, target, threshold, story, false));
    }

    function checkAndFire(uint256 arcId) external {
        Arc storage a = arcs[arcId];
        require(!a.fired, "Arc already fired");

        bool trigger;
        if (a.cond == Condition.Balance) {
            trigger = target.balance >= a.threshold;
        } else if (a.cond == Condition.BlockHeight) {
            trigger = block.number >= a.threshold;
        } else {
            // SigilCount not implemented—placeholder
            trigger = false;
        }

        if (trigger) {
            a.fired = true;
            emit MythArcFired(arcId, a.target, a.story);
        }
    }
}
