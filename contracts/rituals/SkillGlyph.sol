// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract SkillGlyph {
    address public scrollsmith;
    uint256 public glyphCounter;

    struct Glyph {
        string name;
        string skill;
        string location;
        bool valid;
    }

    mapping(uint256 => Glyph) public glyphs;
    mapping(address => uint256[]) public ownerGlyphs;

    event GlyphMinted(address indexed trainee, uint256 indexed glyphId, string skill, string location);

    constructor() {
        scrollsmith = msg.sender;
    }

    modifier onlyScrollsmith() {
        require(msg.sender == scrollsmith, "Not authorized");
        _;
    }

    function mintGlyph(address trainee, string calldata name, string calldata skill, string calldata location) external onlyScrollsmith {
        glyphs[glyphCounter] = Glyph(name, skill, location, true);
        ownerGlyphs[trainee].push(glyphCounter);
        emit GlyphMinted(trainee, glyphCounter, skill, location);
        glyphCounter++;
    }

    function validateGlyph(uint256 glyphId) external view returns (bool) {
        return glyphs[glyphId].valid;
    }

    function getGlyphsByOwner(address owner) external view returns (uint256[] memory) {
        return ownerGlyphs[owner];
    }
}
