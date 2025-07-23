// SPDX-License-Identifier: VINVIN-CyberThreatVault-v1
pragma solidity ^0.8.24;

/// @title vinVaultOfCyberThreatMaps
/// @notice Logs real-time cyber threat signals and scrollkeeper-grade attack patterns
contract vinVaultOfCyberThreatMaps {
    address public scrollkeeper;

    struct ThreatSignal {
        string nation;
        string threatType;
        string attackVector;
        string emojiAlert;
        uint256 timestamp;
    }

    mapping(string => ThreatSignal[]) public threatLog;

    event ThreatLogged(string indexed nation, string threatType, string emoji);

    constructor() {
        scrollkeeper = msg.sender;
    }

    function logThreat(
        string calldata nation,
        string calldata threatType,
        string calldata vector,
        string calldata emoji
    ) external {
        require(msg.sender == scrollkeeper, "Only VINVIN may log cyber threats");
        threatLog[nation].push(ThreatSignal(nation, threatType, vector, emoji, block.timestamp));
        emit ThreatLogged(nation, threatType, emoji);
    }

    function viewThreats(string calldata nation) external view returns (ThreatSignal[] memory) {
        return threatLog[nation];
    }
}
