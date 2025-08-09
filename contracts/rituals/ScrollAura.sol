// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/// @title ScrollAura — Emits ritual auras for mythic events in the scrollchain
/// @author Vinvin
/// @notice Broadcasts symbolic signals tied to milestones, scrolls, and civic upgrades

contract ScrollAura {
    enum AuraType {
        Milestone,
        ScrollMint,
        CivicUpgrade,
        SoulboundEvent,
        MythicPing
    }

    struct Aura {
        uint256 timestamp;
        AuraType auraType;
        string message;
        address emitter;
    }

    Aura[] public auras;

    event AuraEmitted(uint256 indexed timestamp, AuraType auraType, string message, address indexed emitter);

    /// @notice Emit a ritual aura with symbolic meaning
    /// @param _auraType Type of aura (Milestone, ScrollMint, etc.)
    /// @param _message Description of the event or vibe
    function emitAura(AuraType _auraType, string calldata _message) external {
        Aura memory newAura = Aura({
            timestamp: block.timestamp,
            auraType: _auraType,
            message: _message,
            emitter: msg.sender
        });

        auras.push(newAura);
        emit AuraEmitted(block.timestamp, _auraType, _message, msg.sender);
    }

    /// @notice Get total number of auras emitted
    function totalAuras() external view returns (uint256) {
        return auras.length;
    }

    /// @notice Retrieve an aura by index
    function getAura(uint256 index) external view returns (Aura memory) {
        require(index < auras.length, "Invalid index");
        return auras[index];
    }
}
