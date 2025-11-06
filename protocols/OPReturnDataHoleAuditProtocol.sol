// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract OPReturnDataHoleAuditProtocol {
    address public steward;

    struct AuditEntry {
        string txHash;
        string dataSize;
        string exploitType;
        string emotionalTag;
    }

    AuditEntry[] public protocol;

    event OPReturnExploitTagged(string txHash, string dataSize, string exploitType, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagExploit(
        string memory txHash,
        string memory dataSize,
        string memory exploitType,
        string memory emotionalTag
    ) public onlySteward {
        protocol.push(AuditEntry(txHash, dataSize, exploitType, emotionalTag));
        emit OPReturnExploitTagged(txHash, dataSize, exploitType, emotionalTag);
    }
}
