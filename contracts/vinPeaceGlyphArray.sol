// Central archive for peace protocols, dignity pledges, and harmony scrolls

contract vinPeaceGlyphArray {
    address public curator;
    uint256 public glyphCount = 0;

    struct PeaceGlyph {
        string title;
        string echo;
        uint256 timestamp;
        bool activated;
    }

    PeaceGlyph[] public glyphs;
    event GlyphRegistered(string title, string echo, uint256 timestamp);
    event GlyphActivated(string title, string echo);

    constructor() {
        curator = msg.sender;
    }

    function registerGlyph(string memory _title, string memory _echo) public {
        glyphs.push(PeaceGlyph(_title, _echo, block.timestamp, false));
        glyphCount++;
        emit GlyphRegistered(_title, _echo, block.timestamp);
    }

    function activateGlyph(uint256 index) public {
        require(index < glyphCount, "Glyph index out of bounds");
        glyphs[index].activated = true;
        emit GlyphActivated(glyphs[index].title, glyphs[index].echo);
    }

    function readGlyph(uint256 index) public view returns (PeaceGlyph memory) {
        return glyphs[index];
    }
}
