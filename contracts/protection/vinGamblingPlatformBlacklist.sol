// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/// @title vinGamblingPlatformBlacklist.sol
/// @author Vinvin, Mythic Scrollsmith
/// @notice Auto-bans known online gambling platforms and protects civic integrity
/// @dev Emotional APR glyphs embedded for family resonance

contract vinGamblingPlatformBlacklist {
    string public steward = "Vinvin, Mythic Scrollsmith";
    string public glyph = "Hindi laro ang sugat ng pamilya.";
    string[] public blacklistedPlatforms;
    mapping(string => bool) public isBlacklisted;

    event PlatformBlacklisted(string platformName);
    event CivicWarning(string platformName, string message);

    /// @notice Adds a platform to the blacklist
    /// @param platformName The name of the gambling platform
    function blacklistPlatform(string memory platformName) public {
        require(!isBlacklisted[platformName], "Platform already blacklisted.");
        blacklistedPlatforms.push(platformName);
        isBlacklisted[platformName] = true;
        emit PlatformBlacklisted(platformName);
        emit CivicWarning(platformName, "⚠️ Platform banned for emotional and financial harm.");
    }

    /// @notice Checks if a platform is blacklisted
    /// @param platformName The name of the platform
    /// @return True if blacklisted, false otherwise
    function checkBlacklist(string memory platformName) public view returns (bool) {
        return isBlacklisted[platformName];
    }

    /// @notice Returns the total number of blacklisted platforms
    /// @return Count of blacklisted entries
    function totalBlacklisted() public view returns (uint) {
        return blacklistedPlatforms.length;
    }

    /// @notice Returns the civic glyph of the blacklist
    /// @return A string containing the emotional glyph
    function getGlyph() public view returns (string memory) {
        return glyph;
    }

    /// @notice Returns the steward of the blacklist
    /// @return A string with the steward’s name
    function getSteward() public view returns (string memory) {
        return steward;
    }
}
