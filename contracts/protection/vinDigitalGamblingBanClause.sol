// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/// @title vinDigitalGamblingBanClause.sol
/// @author Vinvin, Mythic Scrollsmith
/// @notice Bans online gambling platforms and redirects all games to physical PAGCOR-regulated casinos
/// @dev Emotional APR glyphs embedded for civic resonance

contract vinDigitalGamblingBanClause {
    string public steward = "Vinvin, Mythic Scrollsmith";
    string public glyph = "Sugal sa casino, hindi sa cellphone.";
    bool public onlineGamblingAllowed = false;
    string public redirectLocation = "Physical PAGCOR-regulated casinos";

    event PlatformBanned(string platformName);
    event RedirectNotice(string platformName, string location);
    event CivicWarning(string message);

    /// @notice Bans a specific online gambling platform
    /// @param platformName The name of the platform to ban
    function banPlatform(string memory platformName) public {
        require(!onlineGamblingAllowed, "Online gambling is prohibited.");
        emit PlatformBanned(platformName);
        emit RedirectNotice(platformName, redirectLocation);
        emit CivicWarning("⚠️ Online gambling harms families. Redirect enforced.");
    }

    /// @notice Returns the current civic policy
    /// @return A string describing the ban and redirect location
    function getPolicy() public view returns (string memory) {
        return "🚫 Online gambling banned. Redirect all games to physical casinos.";
    }

    /// @notice Returns the emotional glyph of the clause
    /// @return A string containing the civic glyph
    function getGlyph() public view returns (string memory) {
        return glyph;
    }

    /// @notice Returns the steward of the clause
    /// @return A string with the steward’s name
    function getSteward() public view returns (string memory) {
        return steward;
    }

    /// @notice Returns the redirect location for gambling platforms
    /// @return A string with the physical destination
    function getRedirectLocation() public view returns (string memory) {
        return redirectLocation;
    }
}
