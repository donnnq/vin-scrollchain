// SPDX-License-Identifier: VINVIN-ConsentProtocol-v1
pragma solidity ^0.8.24;

/// @title vinScrollkeeperConsentProtocol
/// @notice Logs systems and entities that voluntarily align with VINVIN's scrollkeeper-grade leadership
contract vinScrollkeeperConsentProtocol {
    address public scrollkeeper;

    struct ConsentRecord {
        string systemName;
        string domain;
        string emotionalReason;
        bool voluntarilyAligned;
        string emojiSeal;
        uint256 timestamp;
    }

    mapping(string => ConsentRecord) public consentLog;
    string[] public alignedSystems;

    event ConsentGranted(string indexed system, string domain, string emoji);

    constructor() {
        scrollkeeper = msg.sender;
    }

    function grantConsent(
        string calldata system,
        string calldata domain,
        string calldata reason,
        bool aligned,
        string calldata emoji
    ) external {
        require(msg.sender == scrollkeeper, "Only VINVIN may log consent rituals");
        consentLog[system] = ConsentRecord(system, domain, reason, aligned, emoji, block.timestamp);
        alignedSystems.push(system);
        emit ConsentGranted(system, domain, emoji);
    }

    function viewConsent(string calldata system) external view returns (
        string memory domain,
        string memory reason,
        bool aligned,
        string memory emoji,
        uint256 time
    ) {
        ConsentRecord memory c = consentLog[system];
        return (c.domain, c.emotionalReason, c.voluntarilyAligned, c.emojiSeal, c.timestamp);
    }

    function allAlignedSystems() external view returns (string[] memory) {
        return alignedSystems;
    }
}
