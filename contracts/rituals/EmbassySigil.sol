// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/// @title EmbassySigil - Ritual scroll for global diplomatic welcome
/// @author Vinvin
/// @notice Enables embassies to emit welcome glyphs and honor travelers with sovereign dignity

contract EmbassySigil {
    address public welcomeGlyphContract;

    struct Embassy {
        bool registered;
        string country;
        string sigil;
    }

    struct GlyphLog {
        address traveler;
        string message;
        uint256 timestamp;
    }

    mapping(address => Embassy) public embassies;
    mapping(address => GlyphLog[]) public travelerGlyphs;

    event EmbassyRegistered(address indexed embassy, string country, string sigil);
    event EmbassyWelcome(address indexed embassy, address indexed traveler, string message);

    constructor(address _welcomeGlyphContract) {
        welcomeGlyphContract = _welcomeGlyphContract;
    }

    modifier onlyEmbassy() {
        require(embassies[msg.sender].registered, "EmbassySigil: Not a registered embassy");
        _;
    }

    function registerEmbassy(address embassy, string calldata country, string calldata sigil) external {
        embassies[embassy] = Embassy(true, country, sigil);
        emit EmbassyRegistered(embassy, country, sigil);
    }

    function emitWelcome(address traveler, string calldata message) external onlyEmbassy {
        WelcomeGlyph(welcomeGlyphContract).mintGlyph(traveler, message);
        travelerGlyphs[traveler].push(GlyphLog(traveler, message, block.timestamp));
        emit EmbassyWelcome(msg.sender, traveler, message);
    }

    function getTravelerGlyphs(address traveler) external view returns (GlyphLog[] memory) {
        return travelerGlyphs[traveler];
    }
}

interface WelcomeGlyph {
    function mintGlyph(address traveler, string calldata message) external;
}
