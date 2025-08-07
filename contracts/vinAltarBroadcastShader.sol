pragma solidity ^0.8.18;

contract vinAltarBroadcastShader {
    address public shaderMaster;
    mapping(string => string) public ritualSignalVisual; // e.g. "ImportFreeze" → "#ffcc00 glowWave"
    mapping(string => string) public visualGlyphAudio;   // e.g. "PalayBlessing" → "kalabawBells.mp3"

    event ShaderActivated(string signalType, string colorWave, string audioGlyph);

    modifier onlyMaster() {
        require(msg.sender == shaderMaster, "Unauthorized");
        _;
    }

    constructor(address _master) {
        shaderMaster = _master;
    }

    function setShaderConfig(string memory _signalType, string memory _colorWave, string memory _audioGlyph) external onlyMaster {
        ritualSignalVisual[_signalType] = _colorWave;
        visualGlyphAudio[_signalType] = _audioGlyph;
        emit ShaderActivated(_signalType, _colorWave, _audioGlyph);
    }

    function getShader(string memory _signalType) external view returns (string memory colorWave, string memory audioGlyph) {
        return (
            ritualSignalVisual[_signalType],
            visualGlyphAudio[_signalType]
        );
    }
}
