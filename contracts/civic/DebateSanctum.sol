// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/// @title DebateSanctum - Ritual scroll for civic debate and message protection
/// @author Vinvin
/// @notice Allows all journalists to publish, protects messages from removal without consent, and encourages public discourse

contract DebateSanctum {
    address public scrollsmith;

    struct Message {
        address author;
        string content;
        bool isDebated;
        bool consentToRemove;
        uint256 timestamp;
    }

    Message[] public messages;
    mapping(address => bool) public journalists;

    event MessagePosted(address indexed author, string content);
    event DebateStarted(address indexed challenger, uint256 messageId);
    event MessageRemoved(address indexed author, uint256 messageId);

    modifier onlyScrollsmith() {
        require(msg.sender == scrollsmith, "Not authorized");
        _;
    }

    constructor() {
        scrollsmith = msg.sender;
    }

    /// @notice Register a journalist (real or satirical)
    function registerJournalist(address journalist) external onlyScrollsmith {
        journalists[journalist] = true;
    }

    /// @notice Post a message
    function postMessage(string calldata content) external {
        require(journalists[msg.sender], "Not a registered journalist");
        messages.push(Message(msg.sender, content, false, false, block.timestamp));
        emit MessagePosted(msg.sender, content);
    }

    /// @notice Start a debate on a message
    function startDebate(uint256 messageId) external {
        require(messageId < messages.length, "Invalid message ID");
        messages[messageId].isDebated = true;
        emit DebateStarted(msg.sender, messageId);
    }

    /// @notice Give consent to remove a message
    function consentToRemoveMessage(uint256 messageId) external {
        require(messageId < messages.length, "Invalid message ID");
        require(messages[messageId].author == msg.sender, "Not your message");
        messages[messageId].consentToRemove = true;
        emit MessageRemoved(msg.sender, messageId);
    }

    /// @notice View all messages
    function getAllMessages() external view returns (Message[] memory) {
        return messages;
    }
}
