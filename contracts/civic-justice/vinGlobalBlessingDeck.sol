// SPDX-License-Identifier: Civic-OS-Global-Blessing-2025
pragma solidity ^0.8.19;

/**
 * @title vinGlobalBlessingDeck
 * @author Vinvin
 * @notice Registers and distributes unified civic badges across sovereign partners
 */

contract vinGlobalBlessingDeck {

    address public stewardCouncil;

    struct GlobalBadge {
        string name;
        string glyph;
        string description;
        string region;
        bool isActive;
    }

    GlobalBadge[] public badges;

    modifier onlyCouncil() {
        require(msg.sender == stewardCouncil, "Only council may manage global badges");
        _;
    }

    constructor() {
        stewardCouncil = msg.sender;
    }

    function registerBadge(
        string memory _name,
        string memory _glyph,
        string memory _description,
        string memory _region
    ) public onlyCouncil {
        badges.push(GlobalBadge({
            name: _name,
            glyph: _glyph,
            description: _description,
            region: _region,
            isActive: true
        }));
    }

    function deactivateBadge(uint _index) public onlyCouncil {
        require(_index < badges.length, "Invalid badge index");
        badges[_index].isActive = false;
    }

    function getBadge(uint _index) public view returns (
        string memory name,
        string memory glyph,
        string memory description,
        string memory region,
        bool isActive
    ) {
        GlobalBadge memory b = badges[_index];
        return (b.name, b.glyph, b.description, b.region, b.isActive);
    }

    function totalBadges() public view returns (uint) {
        return badges.length;
    }
}
