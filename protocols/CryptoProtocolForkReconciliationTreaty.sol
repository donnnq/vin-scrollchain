// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CryptoProtocolForkReconciliationTreaty {
    address public steward;

    struct TreatyEntry {
        string protocolName;
        string timestamp;
        string forkType;
        string reconciliationMethod;
        string emotionalTag;
    }

    TreatyEntry[] public registry;

    event ForkReconciled(string protocolName, string timestamp, string forkType, string reconciliationMethod, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function reconcileFork(
        string memory protocolName,
        string memory timestamp,
        string memory forkType,
        string memory reconciliationMethod,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(TreatyEntry(protocolName, timestamp, forkType, reconciliationMethod, emotionalTag));
        emit ForkReconciled(protocolName, timestamp, forkType, reconciliationMethod, emotionalTag);
    }
}
