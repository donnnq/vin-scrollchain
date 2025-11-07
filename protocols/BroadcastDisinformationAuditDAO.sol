// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BroadcastDisinformationAuditDAO {
    address public steward;

    struct DisinfoEntry {
        string channelName;
        string timestamp;
        string misinformationType;
        string verificationSource;
        string emotionalTag;
    }

    DisinfoEntry[] public registry;

    event DisinformationLogged(string channelName, string timestamp, string misinformationType, string verificationSource, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function logDisinformation(
        string memory channelName,
        string memory timestamp,
        string memory misinformationType,
        string memory verificationSource,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(DisinfoEntry(channelName, timestamp, misinformationType, verificationSource, emotionalTag));
        emit DisinformationLogged(channelName, timestamp, misinformationType, verificationSource, emotionalTag);
    }
}
