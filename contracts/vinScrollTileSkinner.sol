pragma solidity ^0.8.18;

contract vinScrollTileSkinner {
    address public skinnerMaster;

    struct TileSkin {
        string tileID;
        string material;       // e.g. "biocement", "palaySandstone", "scrollglass"
        string surfaceGlyph;   // e.g. "spiralBlessing", "riceLock", "bayanWave"
        string animationMode;  // e.g. "pulse", "shimmer", "glowTrail"
        string triggerSource;  // e.g. DAO, ChimeOracle, CivicLedger
        bool active;
        uint256 installTime;
    }

    TileSkin[] public tiles;

    event TileSkinned(string tileID, string surfaceGlyph, string triggerSource);

    modifier onlyMaster() {
        require(msg.sender == skinnerMaster, "Not authorized");
        _;
    }

    constructor(address _master) {
        skinnerMaster = _master;
    }

    function skinTile(
        string memory _tileID,
        string memory _material,
        string memory _surfaceGlyph,
        string memory _animationMode,
        string memory _triggerSource
    ) external onlyMaster {
        tiles.push(TileSkin(_tileID, _material, _surfaceGlyph, _animationMode, _triggerSource, true, block.timestamp));
        emit TileSkinned(_tileID, _surfaceGlyph, _triggerSource);
    }

    function getActiveTiles() external view returns (TileSkin[] memory) {
        return tiles;
    }

    function deactivateTile(uint256 index) external onlyMaster {
        require(index < tiles.length, "Invalid index");
        tiles[index].active = false;
    }
}
