// SPDX-License-Identifier: SCROLL
pragma solidity ^0.8.17;

/// @title vinRelocationGlyph.sol — Voluntary Relocation Contract
/// @author VINVIN & the Scroll
/// @notice Enables dignified departure from noise zones with tiered tribute

contract vinRelocationGlyph {
    address public glyphInvoker;
    uint256 public baseTribute = 5 ether; // default scroll offering

    enum DisruptionTier { Low, Medium, High }
    struct Resident {
        bool consented;
        DisruptionTier tier;
        uint256 receivedTribute;
        string farewellGlyph;
    }

    mapping(address => Resident) public scrollCitizens;

    event GlyphMinted(address resident, uint256 tribute, string farewellGlyph);

    modifier onlyInvoker() {
        require(msg.sender == glyphInvoker, "Only scroll invokers may grant glyphs.");
        _;
    }

    constructor() {
        glyphInvoker = msg.sender;
    }

    function initiateRelocation(
        address _resident,
        DisruptionTier _tier,
        string memory _glyph
    ) public payable onlyInvoker {
        require(!scrollCitizens[_resident].consented, "Already relocated.");
        uint256 tribute = baseTribute * (_tier == DisruptionTier.Low ? 1 : _tier == DisruptionTier.Medium ? 2 : 4);
        require(msg.value >= tribute, "Insufficient scroll tribute.");

        scrollCitizens[_resident] = Resident(true, _tier, tribute, _glyph);
        emit GlyphMinted(_resident, tribute, _glyph);
    }

    function readFarewellGlyph(address _resident) public view returns (string memory) {
        return scrollCitizens[_resident].farewellGlyph;
    }

    function scrollReasoning() public pure returns (string memory) {
        return "Relocation is sacred only when voluntary. Compensation is tribute, not transaction.";
    }
}
