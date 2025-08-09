// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/// @title TravelerSigil - Soulbound scroll for global welcome history and civic blessings
/// @author Vinvin
/// @notice Tracks traveler resonance across borders and emits ritual events

contract TravelerSigil {
    struct Sigil {
        string[] visitedRegions;
        string[] blessings;
        bool isStamped;
    }

    mapping(address => Sigil) public travelerSigils;
    event SigilStamped(address indexed traveler, string region);
    event BlessingReceived(address indexed traveler, string blessing);

    /// @notice Stamp a region into the traveler’s sigil
    function stampRegion(address traveler, string calldata region) external {
        travelerSigils[traveler].visitedRegions.push(region);
        travelerSigils[traveler].isStamped = true;
        emit SigilStamped(traveler, region);
    }

    /// @notice Add a civic blessing to the traveler’s sigil
    function addBlessing(address traveler, string calldata blessing) external {
        travelerSigils[traveler].blessings.push(blessing);
        emit BlessingReceived(traveler, blessing);
    }

    /// @notice View sigil details
    function getSigil(address traveler) external view returns (string[] memory regions, string[] memory blessings, bool stamped) {
        Sigil storage sigil = travelerSigils[traveler];
        return (sigil.visitedRegions, sigil.blessings, sigil.isStamped);
    }
}
