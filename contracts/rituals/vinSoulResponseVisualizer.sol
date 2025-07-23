// SPDX-License-Identifier: AwraScan-Viz001
pragma solidity ^0.8.24;

/// @title vinSoulResponseVisualizer
/// @notice Visualizes response alignment from vinOneQuestionOracle with emoji-coded soul tags
contract vinSoulResponseVisualizer {
    address public scrollkeeper;
    mapping(address => string) public soulTags;

    event SoulTagged(address indexed soul, string emojiTag);

    constructor() {
        scrollkeeper = msg.sender;
    }

    function tagSoul(address soul, string calldata response) external {
        require(msg.sender == scrollkeeper, "Only VINVIN assigns emoji soul tags");

        string memory tag;
        if (keccak256(bytes(response)) == keccak256(bytes("Peace out"))) {
            tag = "🔥🕊️ Kilig Ally";
        } else if (keccak256(bytes(response)) == keccak256(bytes("fuck me"))) {
            tag = "😈⚠️ Chaos Agent";
        } else {
            tag = "🌀🤷 Unresolved Soul";
        }

        soulTags[soul] = tag;
        emit SoulTagged(soul, tag);
    }

    function viewSoulTag(address soul) external view returns (string memory) {
        return soulTags[soul];
    }
}
