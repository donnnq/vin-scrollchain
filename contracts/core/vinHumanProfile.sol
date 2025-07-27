// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/access/Ownable.sol";

/// @title vinHumanProfile
/// @notice Start every person at 25% respect and let them earn badges to raise their global trust rate.
///         Passive alerts only fire when something negative is sniffed—no active interrogation.
contract vinHumanProfile is Ownable {
    struct Persona {
        string   name;
        uint16   trustRate;          // 0–100, starts at 25
        uint16   badgePoints;        // each point = +1% up to cap
        bool     privacyFlagged;     // true if suspicious private life sniffed
        bool     interventionSuggested;
        bool     exists;
    }

    mapping(address => Persona) private _registry;

    event ProfileCreated(address indexed user, string name);
    event BadgeEarned(address indexed user, uint16 addedPoints, uint16 newTrustRate);
    event PassiveAlert(address indexed user, string reason);

    /// @notice Create your profile. Automatically starts at 25% trust.
    function createProfile(string calldata name) external {
        require(!_registry[msg.sender].exists, "Profile exists");
        _registry[msg.sender] = Persona({
            name:                name,
            trustRate:           25,
            badgePoints:         0,
            privacyFlagged:      false,
            interventionSuggested:false,
            exists:              true
        });
        emit ProfileCreated(msg.sender, name);
    }

    /// @notice Earn badges to boost your trust rate. Capped at 100.
    /// @param points number of badge points to add
    function earnBadge(uint16 points) external {
        Persona storage p = _registry[msg.sender];
        require(p.exists, "No profile");
        require(points > 0, "Must add >0");
        uint16 newPoints = p.badgePoints + points;
        uint16 newRate  = uint16(25 + newPoints);
        if (newRate > 100) {
            newRate = 100;
            newPoints = uint16(100 - 25);
        }
        p.badgePoints = newPoints;
        p.trustRate   = newRate;
        emit BadgeEarned(msg.sender, points, newRate);
    }

    /// @notice System-only sniff: flag if bad behavior detected.
    /// @param user the address to flag
    /// @param reason explanation for the alert
    function sniffActivity(address user, string calldata reason) external onlyOwner {
        Persona storage p = _registry[user];
        require(p.exists, "No profile");
        p.privacyFlagged       = true;
        p.interventionSuggested = true;
        emit PassiveAlert(user, reason);
    }

    /// @notice Retrieve a public summary of a persona.
    function viewProfile(address user)
        external
        view
        returns (
            string memory name,
            uint16        trustRate,
            uint16        badgePoints,
            bool          flagged,
            bool          interventionSuggested
        )
    {
        Persona storage p = _registry[user];
        require(p.exists, "No profile");
        return (
            p.name,
            p.trustRate,
            p.badgePoints,
            p.privacyFlagged,
            p.interventionSuggested
        );
    }
}
