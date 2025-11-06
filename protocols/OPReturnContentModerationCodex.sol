// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract OPReturnContentModerationCodex {
    address public steward;

    struct ContentEntry {
        string txHash;
        string contentType;
        string moderationStatus;
        string emotionalTag;
    }

    ContentEntry[] public codex;

    event OPReturnContentTagged(string txHash, string contentType, string moderationStatus, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagContent(
        string memory txHash,
        string memory contentType,
        string memory moderationStatus,
        string memory emotionalTag
    ) public onlySteward {
        codex.push(ContentEntry(txHash, contentType, moderationStatus, emotionalTag));
        emit OPReturnContentTagged(txHash, contentType, moderationStatus, emotionalTag);
    }
}
