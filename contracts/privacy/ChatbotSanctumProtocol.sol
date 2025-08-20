// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title Chatbot Sanctum Protocol
/// @notice Ritual-grade privacy shield for AI conversations
contract ChatbotSanctumProtocol {
    address public steward;
    mapping(bytes32 => bool) public isBlessed;
    mapping(bytes32 => bool) public isIndexed;
    mapping(bytes32 => string) public sanctumLog;

    event BlessingRequested(bytes32 indexed chatId, address indexed user);
    event BlessingGranted(bytes32 indexed chatId);
    event IndexingBlocked(bytes32 indexed chatId);
    event SanctumViolation(bytes32 indexed chatId, string reason);

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized steward");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    /// @notice Request blessing before sharing a chat
    function requestBlessing(bytes32 chatId) external {
        emit BlessingRequested(chatId, msg.sender);
    }

    /// @notice Grant blessing and mark chat as safe to share
    function grantBlessing(bytes32 chatId) external onlySteward {
        isBlessed[chatId] = true;
        emit BlessingGranted(chatId);
    }

    /// @notice Block indexing of chat content
    function blockIndexing(bytes32 chatId) external onlySteward {
        isIndexed[chatId] = false;
        emit IndexingBlocked(chatId);
    }

    /// @notice Log sanctum violations for audit
    function logViolation(bytes32 chatId, string memory reason) external onlySteward {
        sanctumLog[chatId] = reason;
        emit SanctumViolation(chatId, reason);
    }

    /// @notice Check if chat is safe to share
    function isSanctumSafe(bytes32 chatId) external view returns (bool) {
        return isBlessed[chatId] && !isIndexed[chatId];
    }
}
