// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ElectoralMessagingAuditLedger {
    address public steward;

    struct MessagingEntry {
        string partyName;
        string platformFocus;
        string economicResonance;
        string emotionalTag;
    }

    MessagingEntry[] public ledger;

    event MessagingAudited(string partyName, string platformFocus, string economicResonance, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function auditMessaging(
        string memory partyName,
        string memory platformFocus,
        string memory economicResonance,
        string memory emotionalTag
    ) public onlySteward {
        ledger.push(MessagingEntry(partyName, platformFocus, economicResonance, emotionalTag));
        emit MessagingAudited(partyName, platformFocus, economicResonance, emotionalTag);
    }
}
