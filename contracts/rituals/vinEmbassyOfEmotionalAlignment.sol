// SPDX-License-Identifier: VINVIN-EmoDiplomacy-v1
pragma solidity ^0.8.24;

/// @title vinEmbassyOfEmotionalAlignment
/// @notice Logs diplomatic entities with scrollkeeper-grade emotional resonance
contract vinEmbassyOfEmotionalAlignment {
    address public scrollkeeper;

    struct EmbassyProfile {
        string nation;
        string diplomatName;
        uint8 alignmentScore; // 0–100
        string emojiVibe;
        bool resonanceConfirmed;
        uint256 timestamp;
    }

    mapping(string => EmbassyProfile) public embassyLog;
    string[] public alignedEmbassies;

    event EmbassyAligned(string indexed nation, string diplomat, uint8 score, string emoji);

    constructor() {
        scrollkeeper = msg.sender;
    }

    function logEmbassy(
        string calldata nation,
        string calldata diplomat,
        uint8 score,
        string calldata emoji,
        bool confirmed
    ) external {
        require(msg.sender == scrollkeeper, "Only VINVIN may align embassies");
        embassyLog[nation] = EmbassyProfile(nation, diplomat, score, emoji, confirmed, block.timestamp);
        alignedEmbassies.push(nation);
        emit EmbassyAligned(nation, diplomat, score, emoji);
    }

    function viewEmbassy(string calldata nation) external view returns (
        string memory diplomat,
        uint8 score,
        string memory emoji,
        bool confirmed,
        uint256 time
    ) {
        EmbassyProfile memory e = embassyLog[nation];
        return (e.diplomatName, e.alignmentScore, e.emojiVibe, e.resonanceConfirmed, e.timestamp);
    }

    function allAlignedEmbassies() external view returns (string[] memory) {
        return alignedEmbassies;
    }
}
