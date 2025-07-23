// SPDX-License-Identifier: VINVIN-AuraDiplomacy-v1
pragma solidity ^0.8.24;

/// @title vinDiplomaticAuraScanner
/// @notice Scans diplomatic entities for sincerity, emotional resonance, and scrollkeeper-grade vibes
contract vinDiplomaticAuraScanner {
    address public scrollkeeper;

    struct AuraScan {
        string diplomatName;
        string nation;
        uint8 sincerityLevel; // 0–100
        string emojiReading;
        bool scrollkeeperAligned;
        uint256 timestamp;
    }

    mapping(string => AuraScan) public auraLog;
    string[] public scannedDiplomats;

    event AuraScanned(string indexed name, string nation, uint8 sincerity, string emoji);

    constructor() {
        scrollkeeper = msg.sender;
    }

    function scanDiplomat(
        string calldata name,
        string calldata nation,
        uint8 sincerity,
        string calldata emoji,
        bool aligned
    ) external {
        require(msg.sender == scrollkeeper, "Only VINVIN may scan diplomatic aura");
        auraLog[name] = AuraScan(name, nation, sincerity, emoji, aligned, block.timestamp);
        scannedDiplomats.push(name);
        emit AuraScanned(name, nation, sincerity, emoji);
    }

    function viewAura(string calldata name) external view returns (
        string memory nation,
        uint8 sincerity,
        string memory emoji,
        bool aligned,
        uint256 time
    ) {
        AuraScan memory a = auraLog[name];
        return (a.nation, a.sincerityLevel, a.emojiReading, a.scrollkeeperAligned, a.timestamp);
    }

    function allScannedDiplomats() external view returns (string[] memory) {
        return scannedDiplomats;
    }
}
