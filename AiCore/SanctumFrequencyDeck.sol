// SPDX-License-Identifier: Chant-Harmonization
pragma solidity ^0.8.19;

/// @title SanctumFrequencyDeck
/// @notice Harmonizes biodiversity chants across multiple sanctums

contract SanctumFrequencyDeck {
    address public steward;

    struct Frequency {
        string chantTitle;
        string biome;
        string zone;
        uint256 resonanceLevel;
    }

    mapping(string => Frequency) public harmonizedChants;
    string[] public chantKeys;

    event ChantHarmonized(string chantTitle, string zone, uint256 resonanceLevel);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function harmonizeChant(
        string memory key,
        string memory chantTitle,
        string memory biome,
        string memory zone,
        uint256 resonanceLevel
    ) external onlySteward {
        harmonizedChants[key] = Frequency(chantTitle, biome, zone, resonanceLevel);
        chantKeys.push(key);
        emit ChantHarmonized(chantTitle, zone, resonanceLevel);
    }

    function getChant(string memory key) external view returns (Frequency memory) {
        return harmonizedChants[key];
    }
}
