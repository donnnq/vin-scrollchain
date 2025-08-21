// SPDX-License-Identifier: Biome-APR-Compiler
pragma solidity ^0.8.19;

/// @title PlanetaryChantCompiler
/// @notice Auto-generates chant sequences based on biome and APR resonance

contract PlanetaryChantCompiler {
    address public steward;

    struct ChantSequence {
        string biome;
        string[] chantTitles;
        uint256 averageAPR;
        string emotionThread;
    }

    mapping(string => ChantSequence) public compiledSequences;
    string[] public sequenceKeys;

    event SequenceCompiled(string biome, uint256 averageAPR, string emotionThread);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function compileSequence(
        string memory key,
        string memory biome,
        string[] memory chantTitles,
        uint256 averageAPR,
        string memory emotionThread
    ) external onlySteward {
        compiledSequences[key] = ChantSequence(biome, chantTitles, averageAPR, emotionThread);
        sequenceKeys.push(key);
        emit SequenceCompiled(biome, averageAPR, emotionThread);
    }

    function getSequence(string memory key) external view returns (ChantSequence memory) {
        return compiledSequences[key];
    }
}
