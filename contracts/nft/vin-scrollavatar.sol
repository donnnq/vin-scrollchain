// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract VinScrollAvatar {
    struct Avatar {
        string name;
        string title;
        string glyph;
        string essence;
        string domain;
        string sigil;
        string proclamation;
        bool active;
        uint256 summonedAt;
    }

    Avatar public avatar;
    address public immutable avatarCaller;

    event AvatarSummoned(string name, string title, string glyph, string domain, string proclamation, uint256 timestamp);
    event AvatarDismissed(uint256 timestamp);

    modifier onlyCaller() {
        require(msg.sender == avatarCaller, "Not the avatar caller");
        _;
    }

    constructor() {
        avatarCaller = msg.sender;
    }

    function summonAvatar(
        string calldata name,
        string calldata title,
        string calldata glyph,
        string calldata essence,
        string calldata domain,
        string calldata sigil,
        string calldata proclamation
    ) external onlyCaller {
        avatar = Avatar({
            name: name,
            title: title,
            glyph: glyph,
            essence: essence,
            domain: domain,
            sigil: sigil,
            proclamation: proclamation,
            active: true,
            summonedAt: block.timestamp
        });

        emit AvatarSummoned(name, title, glyph, domain, proclamation, block.timestamp);
    }

    function dismissAvatar() external onlyCaller {
        avatar.active = false;
        emit AvatarDismissed(block.timestamp);
    }

    function getAvatar() external view returns (Avatar memory) {
        return avatar;
    }
}
