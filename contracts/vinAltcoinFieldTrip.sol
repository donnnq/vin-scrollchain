// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

/// @title VINVIN Altcoin Field Trip Log
/// @notice Logs altcoin ecosystem movements and thesis-based breakout adventures
contract vinAltcoinFieldTrip {
    struct AltcoinPing {
        uint256 timestamp;
        address scout;
        string tokenName;        // e.g. “ETH”, “LINK”, “CFX”, “XRP”
        string rallyTheme;       // “zkEVM breakout”, “Oracle ecosystem”, “Regulatory tailwind”
        string originSector;     // “L1”, “Stablecoin infra”, “TradFi bridge”, etc.
        string emotionalTrack;   // “Kilig”, “Hopeful FOMO”, “Meme joy”, “Surprise alpha”
    }

    address public scrollkeeper;
    uint256 public pingCount;
    mapping(uint256 => AltcoinPing) public logs;

    event AltcoinLogged(
        uint256 indexed id,
        address indexed scout,
        string tokenName,
        string rallyTheme
    );

    constructor() {
        scrollkeeper = msg.sender;
    }

    function logTrip(
        string memory _tokenName,
        string memory _rallyTheme,
        string memory _originSector,
        string memory _emotionalTrack
    ) public {
        logs[pingCount] = AltcoinPing({
            timestamp: block.timestamp,
            scout: msg.sender,
            tokenName: _tokenName,
            rallyTheme: _rallyTheme,
            originSector: _originSector,
            emotionalTrack: _emotionalTrack
        });

        emit AltcoinLogged(pingCount, msg.sender, _tokenName, _rallyTheme);
        pingCount++;
    }

    function getTrip(uint256 _id) public view returns (AltcoinPing memory) {
        require(_id < pingCount, "No trip log found");
        return logs[_id];
    }
}
