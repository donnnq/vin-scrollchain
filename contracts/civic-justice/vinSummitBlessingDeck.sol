// SPDX-License-Identifier: Civic-OS-Summit-Blessing-2025
pragma solidity ^0.8.19;

/**
 * @title vinSummitBlessingDeck
 * @author Vinvin
 * @notice Assigns planetary badges to summit attendees based on restoration roles
 */

contract vinSummitBlessingDeck {

    address public stewardCouncil;

    struct SummitBadge {
        string attendeeName;
        string badgeTitle;     // e.g. "Planetary Healer", "Scrollchain Diplomat"
        string glyph;          // e.g. 🌍, 📜, 🛡️
        string roleDescription;
        uint summitTimestamp;
    }

    SummitBadge[] public blessings;

    modifier onlyCouncil() {
        require(msg.sender == stewardCouncil, "Only council may assign summit blessings");
        _;
    }

    constructor() {
        stewardCouncil = msg.sender;
    }

    function assignBlessing(
        string memory _attendeeName,
        string memory _badgeTitle,
        string memory _glyph,
        string memory _roleDescription
    ) public onlyCouncil {
        blessings.push(SummitBadge({
            attendeeName: _attendeeName,
            badgeTitle: _badgeTitle,
            glyph: _glyph,
            roleDescription: _roleDescription,
            summitTimestamp: block.timestamp
        }));
    }

    function getBlessing(uint _index) public view returns (
        string memory attendeeName,
        string memory badgeTitle,
        string memory glyph,
        string memory roleDescription,
        uint summitTimestamp
    ) {
        SummitBadge memory b = blessings[_index];
        return (
            b.attendeeName,
            b.badgeTitle,
            b.glyph,
            b.roleDescription,
            b.summitTimestamp
        );
    }

    function totalBlessings() public view returns (uint) {
        return blessings.length;
    }
}
