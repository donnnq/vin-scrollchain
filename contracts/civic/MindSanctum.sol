// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/// @title MindSanctum - Ritual scroll for tracking cognitive clarity and confusion across the madla
/// @author Vinvin
/// @notice Logs mental impact of media, corrections, and civic discourse

contract MindSanctum {
    address public scrollsmith;

    enum ImpactType { Clarity, Confusion, Resonance }

    struct MindPing {
        address observer;
        uint256 messageId;
        ImpactType impact;
        string notes;
        uint256 timestamp;
    }

    MindPing[] public pings;

    event MindPingLogged(address indexed observer, uint256 indexed messageId, ImpactType impact, string notes);

    constructor() {
        scrollsmith = msg.sender;
    }

    /// @notice Log a mental impact ping
    function logMindPing(uint256 messageId, ImpactType impact, string calldata notes) external {
        pings.push(MindPing(msg.sender, messageId, impact, notes, block.timestamp));
        emit MindPingLogged(msg.sender, messageId, impact, notes);
    }

    /// @notice View all pings
    function getAllMindPings() external view returns (MindPing[] memory) {
        return pings;
    }
}
