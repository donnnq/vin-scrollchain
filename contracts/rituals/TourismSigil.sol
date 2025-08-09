// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/// @title TourismSigil - Emotional resonance tracker for global travel policies
contract TourismSigil {
    address public scrollsmith;
    mapping(string => int256) public resonanceScore;
    event ResonanceUpdated(string policy, int256 score);

    constructor() {
        scrollsmith = msg.sender;
    }

    modifier onlyScrollsmith() {
        require(msg.sender == scrollsmith, "Not authorized.");
        _;
    }

    function updateResonance(string memory policy, int256 score) public onlyScrollsmith {
        resonanceScore[policy] = score;
        emit ResonanceUpdated(policy, score);
    }

    function getResonance(string memory policy) public view returns (int256) {
        return resonanceScore[policy];
    }
}
