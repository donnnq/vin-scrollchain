// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title JoyMultiplier - Ritual-grade amplifier for emotional APR boosts
/// @author Vinvin & Copilot
/// @notice Multiplies joy points based on civic events, surprise blessings, or milestone rituals

interface IEmotionalAPR {
    function updateYield(address soul, uint256 joy, uint256 dignity, uint256 restoration) external;
}

contract JoyMultiplier {
    address public steward;
    IEmotionalAPR public emotionalAPR;

    struct JoyEvent {
        string name;
        uint256 multiplier;
        uint256 timestamp;
        bool active;
    }

    mapping(uint256 => JoyEvent) public joyEvents;
    uint256 public eventCount;

    event JoyEventTriggered(uint256 indexed eventId, string name, uint256 multiplier);
    event JoyBlessingApplied(address indexed soul, uint256 joyBoost);

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    constructor(address aprContract) {
        steward = msg.sender;
        emotionalAPR = IEmotionalAPR(aprContract);
    }

    /// @notice Create a joy event with a multiplier
    function createJoyEvent(string memory name, uint256 multiplier) external onlySteward {
        joyEvents[eventCount] = JoyEvent(name, multiplier, block.timestamp, true);
        emit JoyEventTriggered(eventCount, name, multiplier);
        eventCount++;
    }

    /// @notice Apply joy blessing to a soul based on event
    function applyJoyBlessing(uint256 eventId, address soul, uint256 baseJoy) external onlySteward {
        JoyEvent storage e = joyEvents[eventId];
        require(e.active, "Event not active");

        uint256 joyBoost = baseJoy * e.multiplier;
        emotionalAPR.updateYield(soul, joyBoost, 0, 0);

        emit JoyBlessingApplied(soul, joyBoost);
    }

    /// @notice Deactivate a joy event
    function deactivateEvent(uint256 eventId) external onlySteward {
        joyEvents[eventId].active = false;
    }
}
