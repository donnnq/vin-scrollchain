// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/// @title EmbassySigil - Ritual scroll for global diplomatic welcome
/// @author Vinvin
/// @notice Enables embassies to emit welcome glyphs and honor travelers

contract EmbassySigil {
    address public welcomeGlyphContract;
    mapping(address => bool) public isEmbassy;

    event EmbassyWelcome(address indexed embassy, address indexed traveler, string message);
    event EmbassyRegistered(address indexed embassy);

    constructor(address _welcomeGlyphContract) {
        welcomeGlyphContract = _welcomeGlyphContract;
    }

    modifier onlyEmbassy() {
        require(isEmbassy[msg.sender], "EmbassySigil: Not a registered embassy");
        _;
    }

    function registerEmbassy(address embassy) external {
        isEmbassy[embassy] = true;
        emit EmbassyRegistered(embassy);
    }

    function emitWelcome(address traveler, string calldata message) external onlyEmbassy {
        WelcomeGlyph(welcomeGlyphContract).mintGlyph(traveler, message);
        emit EmbassyWelcome(msg.sender, traveler, message);
    }
}

interface WelcomeGlyph {
    function mintGlyph(address traveler, string calldata message) external;
}
