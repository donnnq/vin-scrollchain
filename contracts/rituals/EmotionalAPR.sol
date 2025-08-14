// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title EmotionalAPR - Tracks emotional yield from civic systems and contracts
/// @author Vinvin & Copilot
/// @notice Soulbound metric for joy, dignity, and restoration earned over time

contract EmotionalAPR {
    address public steward;

    struct EmotionalYield {
        uint256 joyPoints;
        uint256 dignityPoints;
        uint256 restorationPoints;
        uint256 lastUpdated;
    }

    mapping(address => EmotionalYield) public aprLedger;

    event EmotionalYieldUpdated(address indexed soul, uint256 joy, uint256 dignity, uint256 restoration);
    event EmotionalYieldReset(address indexed soul);

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    /// @notice Update emotional yield for a soulbound address
    function updateYield(address soul, uint256 joy, uint256 dignity, uint256 restoration) external onlySteward {
        EmotionalYield storage e = aprLedger[soul];
        e.joyPoints += joy;
        e.dignityPoints += dignity;
        e.restorationPoints += restoration;
        e.lastUpdated = block.timestamp;

        emit EmotionalYieldUpdated(soul, joy, dignity, restoration);
    }

    /// @notice View emotional APR for a soul
    function viewYield(address soul) external view returns (
        uint256 joy,
        uint256 dignity,
        uint256 restoration,
        uint256 lastUpdated
    ) {
        EmotionalYield storage e = aprLedger[soul];
        return (e.joyPoints, e.dignityPoints, e.restorationPoints, e.lastUpdated);
    }

    /// @notice Reset emotional yield (e.g. after ritual closure or soulbound transfer)
    function resetYield(address soul) external onlySteward {
        delete aprLedger[soul];
        emit EmotionalYieldReset(soul);
    }
}
