// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ProtocolForkEmotionalImpactLedger {
    address public steward;

    struct ForkEntry {
        string protocolName;
        string timestamp;
        string forkType;
        string emotionalImpact;
        string communityResponse;
        string emotionalTag;
    }

    ForkEntry[] public ledger;

    event ForkImpactLogged(string protocolName, string timestamp, string forkType, string emotionalImpact, string communityResponse, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function logForkImpact(
        string memory protocolName,
        string memory timestamp,
        string memory forkType,
        string memory emotionalImpact,
        string memory communityResponse,
        string memory emotionalTag
    ) public onlySteward {
        ledger.push(ForkEntry(protocolName, timestamp, forkType, emotionalImpact, communityResponse, emotionalTag));
        emit ForkImpactLogged(protocolName, timestamp, forkType, emotionalImpact, communityResponse, emotionalTag);
    }
}
