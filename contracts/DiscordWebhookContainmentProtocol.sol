// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DiscordWebhookContainmentProtocol {
    address public admin;

    struct WebhookEntry {
        string webhookURL;
        string sourcePackage;
        string emotionalTag;
        bool contained;
        bool revoked;
    }

    WebhookEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function containWebhook(string memory webhookURL, string memory sourcePackage, string memory emotionalTag) external onlyAdmin {
        entries.push(WebhookEntry(webhookURL, sourcePackage, emotionalTag, true, false));
    }

    function revokeWebhook(uint256 index) external onlyAdmin {
        entries[index].revoked = true;
    }

    function getWebhookEntry(uint256 index) external view returns (WebhookEntry memory) {
        return entries[index];
    }
}
