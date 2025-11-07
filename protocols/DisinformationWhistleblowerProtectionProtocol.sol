// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DisinformationWhistleblowerProtectionProtocol {
    address public steward;

    struct WhistleblowerEntry {
        string nameAlias;
        string timestamp;
        string channelReported;
        string protectionStatus;
        string emotionalTag;
    }

    WhistleblowerEntry[] public protocol;

    event WhistleblowerProtected(string nameAlias, string timestamp, string channelReported, string protectionStatus, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function protectWhistleblower(
        string memory nameAlias,
        string memory timestamp,
        string memory channelReported,
        string memory protectionStatus,
        string memory emotionalTag
    ) public onlySteward {
        protocol.push(WhistleblowerEntry(nameAlias, timestamp, channelReported, protectionStatus, emotionalTag));
        emit WhistleblowerProtected(nameAlias, timestamp, channelReported, protectionStatus, emotionalTag);
    }
}
