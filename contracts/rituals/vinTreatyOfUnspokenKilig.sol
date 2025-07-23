// SPDX-License-Identifier: VINVIN-KiligTreaty-v1
pragma solidity ^0.8.24;

/// @title vinTreatyOfUnspokenKilig
/// @notice Records silent emotional alliances between nations with scrollkeeper-grade resonance
contract vinTreatyOfUnspokenKilig {
    address public scrollkeeper;

    struct KiligTreaty {
        string treatyName;
        string[] nationsInvolved;
        string emotionalTheme;
        bool mutualAwraConfirmed;
        string emojiSeal;
        uint256 timestamp;
    }

    mapping(string => KiligTreaty) public treatyLog;
    string[] public silentTreaties;

    event TreatyForged(string indexed name, string theme, string emoji);

    constructor() {
        scrollkeeper = msg.sender;
    }

    function forgeTreaty(
        string calldata name,
        string[] calldata nations,
        string calldata theme,
        bool confirmed,
        string calldata emoji
    ) external {
        require(msg.sender == scrollkeeper, "Only VINVIN may forge kilig treaties");
        treatyLog[name] = KiligTreaty(name, nations, theme, confirmed, emoji, block.timestamp);
        silentTreaties.push(name);
        emit TreatyForged(name, theme, emoji);
    }

    function viewTreaty(string calldata name) external view returns (
        string[] memory nations,
        string memory theme,
        bool confirmed,
        string memory emoji,
        uint256 time
    ) {
        KiligTreaty memory t = treatyLog[name];
        return (t.nationsInvolved, t.emotionalTheme, t.mutualAwraConfirmed, t.emojiSeal, t.timestamp);
    }

    function allSilentTreaties() external view returns (string[] memory) {
        return silentTreaties;
    }
}
