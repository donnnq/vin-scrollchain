// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CommentaryToBiasDetectionProtocol {
    address public steward;

    struct BiasEntry {
        string username;
        string commentContent;
        string biasSignal; // "Partisan framing", "Xenophobic undertone", "Policy oversimplification"
        string emotionalTag;
        bool detected;
        bool sealed;
    }

    BiasEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function detectBias(string memory username, string memory commentContent, string memory biasSignal, string memory emotionalTag) external onlySteward {
        entries.push(BiasEntry(username, commentContent, biasSignal, emotionalTag, true, false));
    }

    function sealBiasEntry(uint256 index) external onlySteward {
        require(entries[index].detected, "Must be detected first");
        entries[index].sealed = true;
    }

    function getBiasEntry(uint256 index) external view returns (BiasEntry memory) {
        return entries[index];
    }
}
