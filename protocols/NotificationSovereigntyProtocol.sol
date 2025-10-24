// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract NotificationSovereigntyProtocol {
    address public steward;

    struct NotificationEntry {
        string sourceApp; // "Bing", "GoIndex", "NASA", "CyberSecurityNews"
        string alertType; // "News", "Finance", "Cybersecurity", "Science"
        string emotionalTag;
        bool indexed;
        bool sealed;
    }

    NotificationEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function indexNotification(string memory sourceApp, string memory alertType, string memory emotionalTag) external onlySteward {
        entries.push(NotificationEntry(sourceApp, alertType, emotionalTag, true, false));
    }

    function sealNotificationEntry(uint256 index) external onlySteward {
        require(entries[index].indexed, "Must be indexed first");
        entries[index].sealed = true;
    }

    function getNotificationEntry(uint256 index) external view returns (NotificationEntry memory) {
        return entries[index];
    }
}
