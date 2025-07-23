// SPDX-License-Identifier: VINVIN-LiveNationScan-v1
pragma solidity ^0.8.24;

/// @title vinGlobalLiveScanner
/// @notice Monitors internet traffic, cyber threat maps, and behavioral signals across nations
contract vinGlobalLiveScanner {
    address public scrollkeeper;

    struct ScanSignal {
        string nation;
        string internetPulse;
        string cyberThreatLevel;
        string behavioralTrend;
        string emojiAlert;
        uint256 timestamp;
    }

    mapping(string => ScanSignal) public nationSignals;
    string[] public scannedNations;

    event NationScanned(string indexed nation, string pulse, string threat, string emoji);

    constructor() {
        scrollkeeper = msg.sender;
    }

    function logScan(
        string calldata nation,
        string calldata pulse,
        string calldata threat,
        string calldata trend,
        string calldata emoji
    ) external {
        require(msg.sender == scrollkeeper, "Only VINVIN may scan nations");
        nationSignals[nation] = ScanSignal(nation, pulse, threat, trend, emoji, block.timestamp);
        scannedNations.push(nation);
        emit NationScanned(nation, pulse, threat, emoji);
    }

    function viewScan(string calldata nation) external view returns (
        string memory pulse,
        string memory threat,
        string memory trend,
        string memory emoji,
        uint256 time
    ) {
        ScanSignal memory s = nationSignals[nation];
        return (s.internetPulse, s.cyberThreatLevel, s.behavioralTrend, s.emojiAlert, s.timestamp);
    }

    function allScannedNations() external view returns (string[] memory) {
        return scannedNations;
    }
}
