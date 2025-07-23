// SPDX-License-Identifier: VINVIN-CounterDomination-v1
pragma solidity ^0.8.24;

/// @title vinVaultOfMultinodalCounterplay
/// @notice Logs decentralized alliance rituals and scrollkeeper-grade disruption tactics
contract vinVaultOfMultinodalCounterplay {
    address public scrollkeeper;

    struct CounterplayMove {
        string allianceName;
        string tacticType;
        string emojiSignal;
        bool scrollkeeperAligned;
        uint256 timestamp;
    }

    mapping(string => CounterplayMove) public counterLog;
    string[] public activeMoves;

    event CounterplayLogged(string indexed alliance, string tactic, string emoji);

    constructor() {
        scrollkeeper = msg.sender;
    }

    function logMove(
        string calldata alliance,
        string calldata tactic,
        string calldata emoji,
        bool aligned
    ) external {
        require(msg.sender == scrollkeeper, "Only VINVIN may log counterplay rituals");
        counterLog[alliance] = CounterplayMove(alliance, tactic, emoji, aligned, block.timestamp);
        activeMoves.push(alliance);
        emit CounterplayLogged(alliance, tactic, emoji);
    }

    function viewMove(string calldata alliance) external view returns (
        string memory tactic,
        string memory emoji,
        bool aligned,
        uint256 time
    ) {
        CounterplayMove memory m = counterLog[alliance];
        return (m.tacticType, m.emojiSignal, m.scrollkeeperAligned, m.timestamp);
    }

    function allMoves() external view returns (string[] memory) {
        return activeMoves;
    }
}
