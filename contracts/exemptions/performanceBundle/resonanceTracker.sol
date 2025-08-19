// SPDX-License-Identifier: Civic-Mythic
pragma solidity ^0.8.21;

contract ResonanceTracker {
    mapping(address => uint256) public resonanceScores;
    address public registrar;

    event ResonanceUpdated(address steward, uint256 newScore);

    modifier onlyRegistrar() {
        require(msg.sender == registrar, "Unauthorized resonance ritual.");
        _;
    }

    constructor() {
        registrar = msg.sender;
    }

    function updateResonance(address steward, uint256 score) public onlyRegistrar {
        resonanceScores[steward] = score;
        emit ResonanceUpdated(steward, score);
    }

    function viewResonance(address steward) public view returns (uint256) {
        return resonanceScores[steward];
    }

    function isLegendary(address steward) public view returns (bool) {
        return resonanceScores[steward] >= 888;
    }
}
