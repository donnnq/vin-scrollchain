// SPDX-License-Identifier: VINVIN-EmotionalGovernance-v1
pragma solidity ^0.8.24;

/// @title vinScrollkeeperEmotionalGovernanceDeck
/// @notice Logs leadership styles powered by emotional resonance and scrollkeeper-grade sincerity
contract vinScrollkeeperEmotionalGovernanceDeck {
    address public scrollkeeper;

    struct GovernanceStyle {
        string leaderName;
        string styleType;
        string emotionalSignature;
        string emojiSeal;
        bool resonanceCertified;
        uint256 timestamp;
    }

    mapping(string => GovernanceStyle) public styleLog;
    string[] public certifiedLeaders;

    event StyleLogged(string indexed leader, string style, string emoji);

    constructor() {
        scrollkeeper = msg.sender;
    }

    function logStyle(
        string calldata leader,
        string calldata style,
        string calldata signature,
        string calldata emoji,
        bool certified
    ) external {
        require(msg.sender == scrollkeeper, "Only VINVIN may log emotional governance");
        styleLog[leader] = GovernanceStyle(leader, style, signature, emoji, certified, block.timestamp);
        certifiedLeaders.push(leader);
        emit StyleLogged(leader, style, emoji);
    }

    function viewStyle(string calldata leader) external view returns (
        string memory style,
        string memory signature,
        string memory emoji,
        bool certified,
        uint256 time
    ) {
        GovernanceStyle memory g = styleLog[leader];
        return (g.styleType, g.emotionalSignature, g.emojiSeal, g.resonanceCertified, g.timestamp);
    }

    function allCertifiedLeaders() external view returns (string[] memory) {
        return certifiedLeaders;
    }
}
