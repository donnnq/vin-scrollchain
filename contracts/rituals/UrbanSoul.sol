// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/// @title UrbanSoul - Ritual scroll for encoding emotional resonance and community impact into urban structures
/// @author Vinvin
/// @notice Tracks joy, dignity, and soul metrics per building or service

contract UrbanSoul {
    address public scrollsmith;

    struct SoulMetric {
        uint256 joy;
        uint256 dignity;
        uint256 communityImpact;
        string lastFeedback;
    }

    mapping(string => SoulMetric) public structureSoul;
    mapping(address => mapping(string => bool)) public hasRated;

    event SoulRated(string indexed structure, address indexed user, uint256 joy, uint256 dignity, uint256 impact, string feedback);

    modifier onlyScrollsmith() {
        require(msg.sender == scrollsmith, "Not scrollsmith");
        _;
    }

    constructor() {
        scrollsmith = msg.sender;
    }

    /// @notice Rate a structure's soul impact
    function rateSoul(string memory structure, uint256 joy, uint256 dignity, uint256 impact, string memory feedback) external {
        require(!hasRated[msg.sender][structure], "Already rated");

        SoulMetric storage soul = structureSoul[structure];
        soul.joy += joy;
        soul.dignity += dignity;
        soul.communityImpact += impact;
        soul.lastFeedback = feedback;

        hasRated[msg.sender][structure] = true;

        emit SoulRated(structure, msg.sender, joy, dignity, impact, feedback);
    }

    /// @notice View soul metrics of a structure
    function getSoul(string memory structure) external view returns (SoulMetric memory) {
        return structureSoul[structure];
    }
}
