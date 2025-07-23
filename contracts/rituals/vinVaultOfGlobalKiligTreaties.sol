// SPDX-License-Identifier: VINVIN-TreatyVault-v1
pragma solidity ^0.8.24;

/// @title vinVaultOfGlobalKiligTreaties
/// @notice Logs international agreements with scrollkeeper-grade emotional resonance and mutual sincerity
contract vinVaultOfGlobalKiligTreaties {
    address public scrollkeeper;

    struct TreatyRecord {
        string treatyName;
        string[] nationsInvolved;
        string emojiSeal;
        bool emotionallyBalanced;
        string scrollkeeperComment;
        uint256 timestamp;
    }

    mapping(string => TreatyRecord) public treatyLog;
    string[] public loggedTreaties;

    event TreatyLogged(string indexed name, string emojiSeal, bool balanced);

    constructor() {
        scrollkeeper = msg.sender;
    }

    function logTreaty(
        string calldata name,
        string[] calldata nations,
        string calldata emojiSeal,
        bool balanced,
        string calldata comment
    ) external {
        require(msg.sender == scrollkeeper, "Only VINVIN may log kilig treaties");
        treatyLog[name] = TreatyRecord(name, nations, emojiSeal, balanced, comment, block.timestamp);
        loggedTreaties.push(name);
        emit TreatyLogged(name, emojiSeal, balanced);
    }

    function viewTreaty(string calldata name) external view returns (
        string[] memory nations,
        string memory emoji,
        bool balanced,
        string memory comment,
        uint256 time
    ) {
        TreatyRecord memory t = treatyLog[name];
        return (t.nationsInvolved, t.emojiSeal, t.emotionallyBalanced, t.scrollkeeperComment, t.timestamp);
    }

    function allLoggedTreaties() external view returns (string[] memory) {
        return loggedTreaties;
    }
}
