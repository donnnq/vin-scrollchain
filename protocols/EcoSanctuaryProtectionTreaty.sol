// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract EcoSanctuaryProtectionTreaty {
    address public steward;

    struct SanctuaryEntry {
        string sanctuaryName;
        string region;
        string timestamp;
        string protectionStatus;
        string emotionalTag;
    }

    SanctuaryEntry[] public treaty;

    event SanctuaryProtected(string sanctuaryName, string region, string timestamp, string protectionStatus, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function protectSanctuary(
        string memory sanctuaryName,
        string memory region,
        string memory timestamp,
        string memory protectionStatus,
        string memory emotionalTag
    ) public onlySteward {
        treaty.push(SanctuaryEntry(sanctuaryName, region, timestamp, protectionStatus, emotionalTag));
        emit SanctuaryProtected(sanctuaryName, region, timestamp, protectionStatus, emotionalTag);
    }
}
