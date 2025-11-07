// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract InsurrectionActLegalLiteracyManifest {
    address public steward;

    struct ModuleEntry {
        string moduleTitle;
        string timestamp;
        string legalTopic;
        string deliveryMethod;
        string emotionalTag;
    }

    ModuleEntry[] public manifest;

    event LegalLiteracyModuleBroadcasted(string moduleTitle, string timestamp, string legalTopic, string deliveryMethod, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function broadcastModule(
        string memory moduleTitle,
        string memory timestamp,
        string memory legalTopic,
        string memory deliveryMethod,
        string memory emotionalTag
    ) public onlySteward {
        manifest.push(ModuleEntry(moduleTitle, timestamp, legalTopic, deliveryMethod, emotionalTag));
        emit LegalLiteracyModuleBroadcasted(moduleTitle, timestamp, legalTopic, deliveryMethod, emotionalTag);
    }
}
