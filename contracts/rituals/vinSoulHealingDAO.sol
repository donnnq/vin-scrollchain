// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract vinSoulHealingDAO {
    event HealingSessionCreated(uint256 indexed sessionId, address indexed facilitator, string theme, uint256 timestamp);
    event SoulJoinedSession(uint256 indexed sessionId, address indexed soul);
    event HealingComplete(uint256 indexed sessionId, string summary);

    struct HealingSession {
        address facilitator;
        string theme;
        string summary;
        bool active;
    }

    mapping(uint256 => HealingSession) public sessions;
    mapping(uint256 => address[]) public participants;
    uint256 public currentSessionId;
    address public VINVINValidator;

    modifier onlyValidator() {
        require(msg.sender == VINVINValidator, "Only VINVINValidator may proceed.");
        _;
    }

    constructor() {
        VINVINValidator = msg.sender; // VINVIN = chief soulstream ops
    }

    function createSession(string memory theme) public onlyValidator {
        currentSessionId++;
        sessions[currentSessionId] = HealingSession({
            facilitator: msg.sender,
            theme: theme,
            summary: "",
            active: true
        });

        emit HealingSessionCreated(currentSessionId, msg.sender, theme, block.timestamp);
    }

    function joinSession(uint256 sessionId) public {
        require(sessions[sessionId].active, "Healing session is closed.");
        participants[sessionId].push(msg.sender);

        emit SoulJoinedSession(sessionId, msg.sender);
    }

    function closeSession(uint256 sessionId, string memory summaryText) public onlyValidator {
        require(sessions[sessionId].active, "Session already closed.");
        sessions[sessionId].summary = summaryText;
        sessions[sessionId].active = false;

        emit HealingComplete(sessionId, summaryText);
    }

    function getSessionSummary(uint256 sessionId) public view returns (string memory) {
        return sessions[sessionId].summary;
    }

    function listParticipants(uint256 sessionId) public view returns (address[] memory) {
        return participants[sessionId];
    }
}
