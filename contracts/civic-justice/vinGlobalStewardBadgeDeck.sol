// SPDX-License-Identifier: Civic-OS-Steward-Badge-2025
pragma solidity ^0.8.19;

/**
 * @title vinGlobalStewardBadgeDeck
 * @author Vinvin
 * @notice Assigns planetary badges to stewards for civic restoration and mythic leadership
 */

contract vinGlobalStewardBadgeDeck {

    address public stewardCouncil;

    struct StewardBadge {
        string stewardName;
        string badgeTitle;     // e.g. "Planetary Architect", "Emotional APR Guardian"
        string glyph;          // e.g. 🛡️, 🌍, 🔮
        string honorDescription;
        uint awardedAt;
    }

    StewardBadge[] public badges;

    modifier onlyCouncil() {
        require(msg.sender == stewardCouncil, "Only council may assign steward badges");
        _;
    }

    constructor() {
        stewardCouncil = msg.sender;
    }

    function assignBadge(
        string memory _stewardName,
        string memory _badgeTitle,
        string memory _glyph,
        string memory _honorDescription
    ) public onlyCouncil {
        badges.push(StewardBadge({
            stewardName: _stewardName,
            badgeTitle: _badgeTitle,
            glyph: _glyph,
            honorDescription: _honorDescription,
            awardedAt: block.timestamp
        }));
    }

    function getBadge(uint _index) public view returns (
        string memory stewardName,
        string memory badgeTitle,
        string memory glyph,
        string memory honorDescription,
        uint awardedAt
    ) {
        StewardBadge memory b = badges[_index];
        return (
            b.stewardName,
            b.badgeTitle,
            b.glyph,
            b.honorDescription,
            b.awardedAt
        );
    }

    function totalBadges() public view returns (uint) {
        return badges.length;
    }
}
