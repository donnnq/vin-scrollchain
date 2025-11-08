// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract NationalSovereigntyMessagingAuditDAO {
    address public steward;

    struct MessagingEntry {
        string timestamp;
        string messageSource;
        string sovereigntyTheme;
        string policyFraming;
        string emotionalTag;
    }

    MessagingEntry[] public registry;

    event SovereigntyMessageAudited(string timestamp, string messageSource, string sovereigntyTheme, string policyFraming, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function auditMessage(
        string memory timestamp,
        string memory messageSource,
        string memory sovereigntyTheme,
        string memory policyFraming,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(MessagingEntry(timestamp, messageSource, sovereigntyTheme, policyFraming, emotionalTag));
        emit SovereigntyMessageAudited(timestamp, messageSource, sovereigntyTheme, policyFraming, emotionalTag);
    }
}
