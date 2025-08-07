// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract vinBadgeAuraRenderer {
    function getAura(uint8 badgeCount) public pure returns (string memory) {
        if (badgeCount <= 2) return "Rust Aura";
        else if (badgeCount <= 4) return "Bronze Glow";
        else if (badgeCount <= 6) return "Silver Shine";
        else if (badgeCount == 7) return "Gold Radiance";
        else if (badgeCount == 8) return "Platinum Pulse";
        else return "Unknown";
    }
}
