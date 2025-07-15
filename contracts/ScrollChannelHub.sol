// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title ScrollChannelHub
/// @notice Stores broadcast messages and flash alerts for real-time UI consumption.
contract ScrollChannelHub {
    address public owner;

    struct Broadcast {
        uint256 id;
        string category; // e.g., "comedy", "lore", "pet"
        string content;
        uint256 timestamp;
    }

    struct Alert {
        uint256 id;
        string symbol;    // e.g., "XRP", "ETH"
        string message;   // e.g., "liquidation brewing"
        uint256 timestamp;
    }

    uint256 private nextBroadcastId;
    uint256 private nextAlertId;

    Broadcast[] public broadcasts;
    Alert[] public alerts;

    event NewBroadcast(uint256 indexed id, string category, string content);
    event NewAlert(uint256 indexed id, string symbol, string message);

    modifier onlyOwner() {
        require(msg.sender == owner, "Not authorized");
        _;
    }

    constructor() {
        owner = msg.sender;
    }

    /// @notice Post a new broadcast message (e.g., skit, comedy, lore).
    function postBroadcast(string calldata category, string calldata content) external onlyOwner {
        broadcasts.push(Broadcast(nextBroadcastId, category, content, block.timestamp));
        emit NewBroadcast(nextBroadcastId, category, content);
        nextBroadcastId++;
    }

    /// @notice Post a flash alert (e.g., market event, liquidation).
    function postAlert(string calldata symbol, string calldata message) external onlyOwner {
        alerts.push(Alert(nextAlertId, symbol, message, block.timestamp));
        emit NewAlert(nextAlertId, symbol, message);
        nextAlertId++;
    }

    /// @notice Retrieve recent broadcasts (up to `count`).
    function getRecentBroadcasts(uint256 count) external view returns (Broadcast[] memory) {
        uint256 start = broadcasts.length > count ? broadcasts.length - count : 0;
        uint256 len = broadcasts.length - start;
        Broadcast[] memory slice = new Broadcast[](len);
        for (uint i = 0; i < len; i++) {
            slice[i] = broadcasts[start + i];
        }
        return slice;
    }

    /// @notice Retrieve recent alerts (up to `count`).
    function getRecentAlerts(uint256 count) external view returns (Alert[] memory) {
        uint256 start = alerts.length > count ? alerts.length - count : 0;
        uint256 len = alerts.length - start;
        Alert[] memory slice = new Alert[](len);
        for (uint i = 0; i < len; i++) {
            slice[i] = alerts[start + i];
        }
        return slice;
    }
}
