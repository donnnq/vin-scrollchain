// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/// @title VinGlyphOracle - Ritual-based trigger and event oracle for portfolio rebalance
/// @author VINVIN
contract VinGlyphOracle {
    address public steward;
    uint256 public moonCycleCounter;
    mapping(bytes32 => bool) public ritualTriggers;

    event OracleMarked(bytes32 triggerGlyph, bool active);
    event MoonCycleAdvanced(uint256 newCycle);
    event OracleMessage(string message);

    modifier onlySteward() {
        require(msg.sender == steward, "Steward only.");
        _;
    }

    constructor() {
        steward = msg.sender;
        moonCycleCounter = 0;

        // Initialize ritual triggers
        _markTrigger("NewMoon_Rebalance", true);
        _markTrigger("FullMoon_Audit", true);
        _markTrigger("MarketShock_Adjust", true);
    }

    function _markTrigger(bytes32 glyph, bool active) internal {
        ritualTriggers[glyph] = active;
        emit OracleMarked(glyph, active);
    }

    function toggleTrigger(bytes32 glyph) external onlySteward {
        ritualTriggers[glyph] = !ritualTriggers[glyph];
        emit OracleMarked(glyph, ritualTriggers[glyph]);
    }

    function advanceMoonCycle() external onlySteward {
        moonCycleCounter++;
        emit MoonCycleAdvanced(moonCycleCounter);
        emit OracleMessage("Moon cycle advanced. Glyphs recalibrating.");
    }

    function isTriggerActive(bytes32 glyph) external view returns (bool) {
        return ritualTriggers[glyph];
    }
}
